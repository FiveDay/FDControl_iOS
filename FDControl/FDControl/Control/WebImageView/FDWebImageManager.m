//
//  FDWebImageManager.m
//  FDControl
//
//  Created by zhangyu528 on 2019/3/15.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDWebImageManager.h"
#import "FDWebImageDownloader.h"
#import "FDMemoryCache.h"
#import "FDDiskCache.h"
#import "NSString+FDMD5.h"

@interface FDWebImageManager ()
@property(strong, nonatomic, nonnull)FDWebImageDownloader* imageDownloader;
@end

@implementation FDWebImageManager

+ (instancetype)shared {
    static FDWebImageManager* _instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc]init];
    });
    return _instance;
}

- (instancetype)init {
    if (self = [super init]) {
        _imageDownloader = [FDWebImageDownloader new];
    }
    return self;
}

- (void)loadImageWithURL:(NSURL*)url
            completed:(FDWebImageManagerCompletedBlock)completedBlock {
    FDMemoryCache* memCache = [[FDMemoryCache alloc]init];
    NSData* data = [memCache objectForKey:[url.absoluteString fd_toMD5String16]];
    UIImage* image = [UIImage imageWithData:data];
    if (data && image) {
        completedBlock(image, nil);
    }else {
        FDDiskCache* diskCache = [[FDDiskCache alloc]initWithKey:url.absoluteString];
        [diskCache queryData:^(NSData * _Nullable data) {
            UIImage* image = [UIImage imageWithData:data];
            if (image) {
                completedBlock(image, nil);
            }else {
                [self.imageDownloader downloadImageWithURL:url completed:^(UIImage * _Nullable image, NSError * _Nullable error) {
                    if (!error) {
                        [memCache setObject:UIImagePNGRepresentation(image) forKey:[url.absoluteString fd_toMD5String16]];
                        [diskCache storeData:UIImagePNGRepresentation(image) completion:nil];
                        completedBlock(image, nil);
                    }else {
                        completedBlock(nil, error);
                    }
                }];
            }
        }];
    }
}
@end

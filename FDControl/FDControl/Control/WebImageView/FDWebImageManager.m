//
//  FDWebImageManager.m
//  FDControl
//
//  Created by zhangyu528 on 2019/3/15.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDWebImageManager.h"
#import "FDWebImageDownloader.h"

@interface FDWebImageManager ()
@property(strong, nonatomic)FDWebImageDownloader* imageDownloader;
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
        _imageDownloader = [FDWebImageDownloader shared];
    }
    return self;
}

- (void)loadImageWith:(NSURL*)url
            completed:(nullable FDWebImageManagerCompletedBlock)completedBlock {
    [self.imageDownloader downloadImageWithURL:url completed:completedBlock];
}
@end

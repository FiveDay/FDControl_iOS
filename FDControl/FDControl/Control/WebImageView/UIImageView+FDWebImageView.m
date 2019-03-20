//
//  UIImageView+FDWebImageView.m
//  FDControl
//
//  Created by zhangyu528 on 2019/3/14.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "UIImageView+FDWebImageView.h"
#import "FDWebImageManager.h"

@implementation UIImageView (FDWebImageView)

- (void)fd_setImageWithURL:(nonnull NSURL *)url {
    NSParameterAssert(url);
    NSParameterAssert([url isKindOfClass:NSURL.class]);
    
    __weak __typeof(self)wself = self;

    [[FDWebImageManager shared]loadImageWith:url completed:^(UIImage * _Nullable image, NSError * _Nullable error) {
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            wself.image = image;
        }];
    }];
}
@end

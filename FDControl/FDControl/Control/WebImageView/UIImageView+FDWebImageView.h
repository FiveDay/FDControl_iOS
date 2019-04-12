//
//  UIImageView+FDWebImageView.h
//  FDControl
//
//  Created by zhangyu528 on 2019/3/14.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (FDWebImageView)

- (void)fd_setImageWithURL:(nonnull NSURL*)url
          placeholderImage:(nullable UIImage*)placeholder;

@end

NS_ASSUME_NONNULL_END

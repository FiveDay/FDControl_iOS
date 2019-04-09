//
//  UIImageView+FDImageCoder.h
//  FDControl
//
//  Created by zhang nan on 2019/4/8.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (FDImageCoder)

+ (BOOL)shouldDecodeImage:(nullable UIImage*)image;

- (UIImage*)fd_decompressedImageWithImage:(nullable UIImage*)image;

@end

NS_ASSUME_NONNULL_END

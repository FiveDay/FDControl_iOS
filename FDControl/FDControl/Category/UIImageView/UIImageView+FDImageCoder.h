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

typedef void(^IMAGEDECOMPRESSEDBLOCK)(NSError* error, UIImage* originImage, UIImage* compressedImage);

@interface UIImageView (FDImageCoder)

/* 向当前imageView 设置图片，无需进行imageView.image = image操作
 */
- (void)fd_asyncSetImageOnMainThread:(UIImage*)image;


@end

NS_ASSUME_NONNULL_END

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

typedef void(^IMAGEDECOMPRESSEDBLOCK)(UIImage* compressedImage);

@interface UIImageView (FDImageCoder)

/* 判断当前image是否可以解码*/
+ (BOOL)shouldDecodeImage:(nullable UIImage*)image;

/*同步对image解码*/
- (UIImage*)fd_DecompressedImageWithImage:(nullable UIImage*)image;

/*异步对image解码*/
- (void)fd_asyncDecompressedImageWithImage:(nullable UIImage*)image completionHandler:(void (^)(UIImage* compressedImage))completionHandler;

@end

NS_ASSUME_NONNULL_END

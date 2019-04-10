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

/*异步对image解码*/
- (void)fd_asyncDecompressedImageWithImage:(nullable UIImage*)image completionHandler:(void (^)(NSError* _Nullable error, UIImage* originImage, UIImage* _Nullable compressedImage))completionHandler;

@end

NS_ASSUME_NONNULL_END

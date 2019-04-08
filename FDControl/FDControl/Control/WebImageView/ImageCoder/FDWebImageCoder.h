//
//  FDWebImageCoder.h
//  FDControl
//
//  Created by zhang nan on 2019/4/8.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FDWebImageCoder : NSObject

+ (BOOL)shouldDecodeImage:(nullable UIImage*)webImage;

- (UIImage*)fd_decompressedImageWithImage:(nullable UIImage*)webImage;

@end

NS_ASSUME_NONNULL_END

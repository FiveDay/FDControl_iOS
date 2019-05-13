//
//  UIImage+FDColor.h
//  FDControl
//
//  Created by zhang nan on 2019/1/23.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (FDColor)

/**
 *   创建size大小的Image，并使用color进行填充
 *  return: 生成的Image，如果为nil，说明参数异常，Image生成失败
 */
+ (UIImage* _Nullable)imageWithColor:(UIColor*)color andSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END

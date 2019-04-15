//
//  UIColor+FDGradientColor.h
//  FDControl
//
//  Created by zhangyu528 on 2019/4/12.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (FDGradientColor)

+ (UIColor*)colorWithLinearGradient:(CGRect)frame startColor:(UIColor*)startColor endColor:(UIColor*)endColor;

@end

NS_ASSUME_NONNULL_END

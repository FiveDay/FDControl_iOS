//
//  UIColor+FDGradientColor.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/12.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "UIColor+FDGradientColor.h"
#import "UIImage+FDGradient.h"

@implementation UIColor (FDGradientColor)
+ (UIColor*)colorWithLinearGradient:(CGRect)frame startColor:(UIColor*)startColor endColor:(UIColor*)endColor {
    FDLinearGradientParam param;
    param.startColor = startColor;
    param.endColor = endColor;
    param.startPoint = CGPointMake(0.0, 0.5);
    param.endPoint = CGPointMake(1.0, 0.5);
    UIImage* image = [UIImage imageLinearGradientWithRect:frame param:param];
    return  [UIColor colorWithPatternImage:image];
}
@end

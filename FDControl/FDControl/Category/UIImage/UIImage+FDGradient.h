//
//  UIImage+FDGradient.h
//  FDControl
//
//  Created by zhangyu528 on 2019/1/3.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef struct FDLinearGradientParam {
    CGPoint startPoint;
    CGPoint endPoint;
    CGColorRef startColor;
    CGColorRef endColor;
}FDLinearGradientParam;

typedef struct FDRadialGradientParam {
    CGRect rect;
    CGPoint centerPoint;
    CGFloat startRadius;
    CGFloat endRadius;
    CGColorRef startColor;
    CGColorRef endColor;
}FDRadialGradientParam;


@interface UIImage (FDGradient)

+ (UIImage*)imageLinearGradientWithRect:(CGRect)rect param:(FDLinearGradientParam)param;
+ (UIImage*)imageRadialGradientWithRect:(CGRect)rect param:(FDRadialGradientParam)param;
@end

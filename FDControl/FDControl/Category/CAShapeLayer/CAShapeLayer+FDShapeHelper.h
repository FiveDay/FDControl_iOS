//
//  CAShapeLayer+FDShapeHelper.h
//  FDControl
//
//  Created by zhangyu528 on 2019/4/3.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CAShapeLayer (FDShapeHelper)

+ (CAShapeLayer*)dotShapeLayer:(CGSize)size color:(CGColorRef)color;
+ (CAShapeLayer*)circleThirdFourShapeLayer:(CGSize)size color:(CGColorRef)color;
+ (CAShapeLayer*)squareShapeLayer:(CGSize)size color:(CGColorRef)color;
+ (CAShapeLayer*)triangleShapelayer:(CGSize)size color:(CGColorRef)color;

@end

NS_ASSUME_NONNULL_END

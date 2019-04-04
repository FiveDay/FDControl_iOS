//
//  CAShapeLayer+FDShapeHelper.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/3.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "CAShapeLayer+FDShapeHelper.h"

@implementation CAShapeLayer (FDShapeHelper)

+ (CAShapeLayer*)dotShapeLayer:(CGSize)size color:(CGColorRef)color {
    CAShapeLayer* layer = [CAShapeLayer new];
    CGPathRef path = CGPathCreateWithEllipseInRect(CGRectMake(0, 0, size.width, size.height), nil);
    layer.fillColor = color;
    layer.backgroundColor = nil;
    layer.path = path;
    layer.frame = CGRectMake(0, 0, size.width, size.height);
    return layer;
}

@end

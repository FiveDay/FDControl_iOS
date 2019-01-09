//
//  FDActivityIndicatorShape.m
//  FDControl
//
//  Created by zhangyu528 on 2019/1/9.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDActivityIndicatorShape.h"

@implementation FDActivityIndicatorShape

+ (CALayer*)getCircleWith:(CGSize)size color:(UIColor*)color {
    
    CAShapeLayer* layer = [CAShapeLayer new];
    UIBezierPath* path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(size.width / 2, size.height / 2) radius:size.width / 2 startAngle:0 endAngle:M_PI * 2 clockwise:NO];
    layer.fillColor = color.CGColor;
    layer.backgroundColor = nil;
    layer.path = path.CGPath;
    layer.frame = CGRectMake(0, 0, size.width, size.height);
    return layer;
}
@end

//
//  FDActivityIndicatorAnimationSquareSpin.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/4.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDActivityIndicatorAnimationSquareSpin.h"

#import "CAShapeLayer+FDShapeHelper.h"

@interface FDActivityIndicatorAnimationSquareSpin ()
@property(assign, nonatomic)CGFloat width;
@end

@implementation FDActivityIndicatorAnimationSquareSpin

- (instancetype)initWithWidth:(CGFloat)width {
    if (self = [super init]) {
        _width = width;
    }
    return self;
}

- (void)setupAnimation:(CALayer*)layer color:(UIColor*)color {
    CFTimeInterval duration = 3;
    //Animation
    CAKeyframeAnimation* ani = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    ani.keyTimes = @[@0, @0.25, @0.5, @0.75, @1];
    ani.values = @[
                   [NSValue valueWithCATransform3D:CATransform3DConcat([self createRotateXTransform: 0], [self createRotateYTransform:0])],
                   [NSValue valueWithCATransform3D:CATransform3DConcat([self createRotateXTransform: M_PI], [self createRotateYTransform:0])],
                   [NSValue valueWithCATransform3D:CATransform3DConcat([self createRotateXTransform: M_PI], [self createRotateYTransform:M_PI])],
                  [NSValue valueWithCATransform3D:CATransform3DConcat([self createRotateXTransform: 0], [self createRotateYTransform:M_PI])],
                   [NSValue valueWithCATransform3D:CATransform3DConcat([self createRotateXTransform: 0], [self createRotateYTransform:0])],
               ];
    ani.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                             [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                             [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                             [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    ani.duration = duration;
    ani.repeatCount = HUGE;
    
    CGSize squareSize = CGSizeMake(self.width, self.width);
    CALayer* square = [CAShapeLayer squareShapeLayer:squareSize color:color.CGColor];
    square.position = CGPointMake(layer.frame.size.width / 2, layer.frame.size.height / 2);
    square.bounds = CGRectMake(0, 0, squareSize.width, squareSize.height);
    [square addAnimation:ani forKey:@"animation"];
    [layer addSublayer:square];
}

- (CATransform3D)createRotateXTransform:(CGFloat)angle {
    CATransform3D transform = CATransform3DMakeRotation(angle, 1, 0, 0);
    transform.m34 = -1.f / 100;
    return transform;
}

- (CATransform3D)createRotateYTransform:(CGFloat)angle {
    CATransform3D transform = CATransform3DMakeRotation(angle, 0, 1, 0);
    transform.m34 = -1.f / 100;
    return transform;
}
@end

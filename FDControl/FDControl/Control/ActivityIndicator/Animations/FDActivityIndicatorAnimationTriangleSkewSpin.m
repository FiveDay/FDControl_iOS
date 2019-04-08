//
//  FDActivityIndicatorAnimationTriangleSkewSpin.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/8.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDActivityIndicatorAnimationTriangleSkewSpin.h"

#import "CAShapeLayer+FDShapeHelper.h"

@interface FDActivityIndicatorAnimationTriangleSkewSpin ()
@property(assign, nonatomic)CGSize size;
@end

@implementation FDActivityIndicatorAnimationTriangleSkewSpin

- (instancetype)initWithSize:(CGSize)size {
    if (self = [super init]) {
        _size = size;
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
    //Draw shape
    CAShapeLayer* triangle = [CAShapeLayer triangleShapelayer:self.size color:color.CGColor];
    triangle.position = CGPointMake(layer.frame.size.width / 2, layer.frame.size.height / 2);
    triangle.bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    [triangle addAnimation:ani forKey:@"animation"];
    [layer addSublayer:triangle];
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

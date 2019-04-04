//
//  FDActivityIndicatorAnimationBallPulse.m
//  FDControl
//
//  Created by zhangyu528 on 2019/1/8.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDActivityIndicatorAnimationBallPulse.h"

#import "FDActivityIndicatorShape.h"
#import "CAShapeLayer+FDShapeHelper.h"

@interface FDActivityIndicatorAnimationBallPulse ()
@property(assign, nonatomic)CGFloat radius;
@end
@implementation FDActivityIndicatorAnimationBallPulse

- (instancetype)initWithBallRadius:(CGFloat)radius {
    if (self = [super init]) {
        _radius = radius;
    }
    return self;
}

- (void)setupAnimation:(CALayer*) layer color:(UIColor*)color {
    // Animation
    CFTimeInterval duration = 0.75;
    CAMediaTimingFunction* timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.2 :0.68 :0.18 :1.08];
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation.keyTimes = @[@0, @0.3, @1];
    animation.timingFunctions = @[timingFunction, timingFunction];
    animation.values = @[@1, @0.3, @1];
    animation.duration = duration;
    animation.repeatCount = HUGE;
    animation.removedOnCompletion = NO;
    
    // Draw ball layout
    CGFloat ballNum = 3;
    CGFloat ballSpacing = 2;

    CGSize ballSize = CGSizeMake(self.radius * 2, self.radius * 2);
    CGFloat x = 0;
    CGFloat y = (layer.bounds.size.height - ballSize.height) / 2;
    CFTimeInterval beginTime = CACurrentMediaTime();
    NSArray<NSNumber*>* beginTimes = @[@0.12, @0.24, @0.36];
    
    for (NSInteger index = 0; index < ballNum; index ++) {
        CALayer* ball = [CAShapeLayer dotShapeLayer:ballSize color:color.CGColor];
        CGRect frame = CGRectMake(x + ballSize.width * index + index * ballSpacing, y, ballSize.width, ballSize.height);
        ball.frame = frame;
        // Add animation
        animation.beginTime = beginTime + beginTimes[index].doubleValue;
        [ball addAnimation:animation forKey:@"animation"];
        [layer addSublayer:ball];
    }
}
@end

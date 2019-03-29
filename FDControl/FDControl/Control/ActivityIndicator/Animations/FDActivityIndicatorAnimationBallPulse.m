//
//  FDActivityIndicatorAnimationBallPulse.m
//  FDControl
//
//  Created by zhangyu528 on 2019/1/8.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDActivityIndicatorAnimationBallPulse.h"

#import "FDActivityIndicatorShape.h"

@implementation FDActivityIndicatorAnimationBallPulse

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
    CGSize size = layer.bounds.size;

    CGFloat ballSize = (size.width - (ballNum - 1)*ballSpacing) / ballNum;
    CGFloat x = (layer.bounds.size.width - size.width) / 2;
    CGFloat y = (layer.bounds.size.height - ballSize) / 2;
    CFTimeInterval beginTime = CACurrentMediaTime();
    NSArray<NSNumber*>* beginTimes = @[@0.12, @0.24, @0.36];
    
    for (NSInteger index = 0; index < 3; index ++) {
        CALayer* ball = [FDActivityIndicatorShape getBallWith:CGSizeMake(ballSize, ballSize) color:color];
        CGRect frame = CGRectMake(x + ballSize * index + index * ballSpacing, y, ballSize, ballSize);
        ball.frame = frame;
        // Add animation
        animation.beginTime = beginTime + beginTimes[index].doubleValue;
        [ball addAnimation:animation forKey:@"animation"];
        [layer addSublayer:ball];
    }
}
@end

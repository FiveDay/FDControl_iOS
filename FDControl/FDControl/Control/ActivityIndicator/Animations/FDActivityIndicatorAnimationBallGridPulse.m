//
//  FDActivityIndicatorAnimationBallGridPulse.m
//  FDControl
//
//  Created by zhangyu528 on 2019/3/28.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDActivityIndicatorAnimationBallGridPulse.h"
#import "FDActivityIndicatorShape.h"

@implementation FDActivityIndicatorAnimationBallGridPulse

- (void)setupAnimation:(CALayer*) layer color:(UIColor*)color {
    
    //Animation
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation.values = @[@1, @0.3, @1];
    animation.keyTimes = @[@0, @0.3, @1];
    animation.removedOnCompletion = NO;
    animation.repeatCount = HUGE;
    CFTimeInterval duration = 0.75;
    animation.duration = duration;
    CAMediaTimingFunction* timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.2 :0.68 :0.18 :1.08];
    animation.timingFunctions = @[timingFunction, timingFunction];
    
    //Draw grid circle layout
    NSInteger balls= 3;
    NSInteger groups = 3;
    CGFloat spacing = 2;
    CGSize size = layer.bounds.size;
    CGFloat ballSize = (size.width - (balls + 1)*spacing) / balls;
    ballSize = ballSize < (size.height - (groups + 1)*spacing) / balls? ballSize:(size.height - (groups + 1)*spacing)/balls;
    CGFloat x = (layer.bounds.size.width - size.width) / 2;
    CGFloat y = (layer.bounds.size.height - size.height) / 2;
    
    CFTimeInterval beginTime = CACurrentMediaTime();
    NSArray<NSNumber*>* beginTimes = @[@0.12, @0.24, @0.36];
    
    for (NSInteger group = 0; group < groups; group++) {
        for (NSInteger index = 0; index < balls; index++) {
            CALayer* ball = [FDActivityIndicatorShape getBallWith:CGSizeMake(ballSize, ballSize) color:color];
            CGRect frame = CGRectMake(x + ballSize * index + spacing, y + group * ballSize, ballSize, ballSize);
            ball.frame = frame;
            //Add animation
            animation.beginTime = beginTime + beginTimes[index].doubleValue;
            [ball addAnimation:animation forKey:@"animation"];
            [layer addSublayer:ball];
        }
    }
}

@end

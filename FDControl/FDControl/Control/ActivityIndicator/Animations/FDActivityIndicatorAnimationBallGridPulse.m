//
//  FDActivityIndicatorAnimationBallGridPulse.m
//  FDControl
//
//  Created by zhangyu528 on 2019/3/28.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDActivityIndicatorAnimationBallGridPulse.h"

#import "CAShapeLayer+FDShapeHelper.h"

@interface FDActivityIndicatorAnimationBallGridPulse ()
@property(assign, nonatomic)CGFloat radius;
@end

@implementation FDActivityIndicatorAnimationBallGridPulse

- (instancetype)initWithBallRadius:(CGFloat)radius {
    if (self = [super init]) {
        _radius = radius;
    }
    return self;
}

- (void)setupAnimation:(CALayer*) layer color:(UIColor*)color {
    
    CAMediaTimingFunction* timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    //Scale Animation
    CAKeyframeAnimation* keyScaleAni = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    keyScaleAni.values = @[@1, @0.5, @1];
    keyScaleAni.keyTimes = @[@0, @0.5, @1];
    keyScaleAni.timingFunctions = @[timingFunction, timingFunction];
    
    //Opacity Animation
    CAKeyframeAnimation* keyOpacityAni= [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    keyOpacityAni.keyTimes = @[@0, @0.5, @1];
    keyOpacityAni.values = @[@1, @0.7, @1];
    keyOpacityAni.timingFunctions = @[timingFunction, timingFunction];

    
    // Animation Group
    CAAnimationGroup* animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[keyScaleAni, keyOpacityAni];
    animationGroup.repeatCount = HUGE;
    animationGroup.removedOnCompletion = NO;
    
    //Draw grid circle layout
    NSInteger balls= 3;
    NSInteger groups = 3;
    CGFloat spacing = 2;
    CGSize size = layer.bounds.size;
    CGSize ballSize = CGSizeMake(self.radius * 2, self.radius * 2);
    CGFloat x = 0;
    CGFloat y = (layer.bounds.size.height - size.height) / 2;
    
    CFTimeInterval beginTime = CACurrentMediaTime();
    NSArray<NSNumber*>* beginTimes = @[@-0.06, @0.25, @-0.17,
                                       @0.48, @0.31, @0.03,
                                       @0.46, @0.78, @0.45];
    NSArray<NSNumber*>* durations = @[@0.72, @1.02, @1.28,
                                      @1.42, @1.45, @1.18,
                                      @0.87, @1.45, @1.06];
    
    for (NSInteger group = 0; group < groups; group++) {
        for (NSInteger index = 0; index < balls; index++) {
            CALayer* ball = [CAShapeLayer dotShapeLayer:ballSize color:color.CGColor];
            CGRect frame = CGRectMake(x + ballSize.width * index + index * spacing, y + group * ballSize.height + group * spacing, ballSize.width, ballSize.height);
            ball.frame = frame;
            //Add animation
            animationGroup.duration = durations[balls * group + index].doubleValue;
            animationGroup.beginTime = beginTime + beginTimes[balls*group + index].doubleValue;
            [ball addAnimation:animationGroup forKey:@"animation"];
            [layer addSublayer:ball];
        }
    }
}

@end

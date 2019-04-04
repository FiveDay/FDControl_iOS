//
//  FDActivityIndicatorAnimationBallClipRotate.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/4.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDActivityIndicatorAnimationBallClipRotate.h"

#import "CAShapeLayer+FDShapeHelper.h"

@interface FDActivityIndicatorAnimationBallClipRotate ()
@property(assign, nonatomic)CGFloat radius;
@end
@implementation FDActivityIndicatorAnimationBallClipRotate

- (instancetype)initWithRadius:(CGFloat)radius {
    if (self = [super init]) {
        _radius = radius;
    }
    return self;
}

- (void)setupAnimation:(CALayer*)layer color:(UIColor*)color {
    CFTimeInterval duration = 0.75;
    
    //Rotate Animation
    CABasicAnimation* rotateAni = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAni.fromValue = @0.f;
    rotateAni.toValue = @(M_PI * 2);
    rotateAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    //Scale Animation
    CAKeyframeAnimation* scaleAni = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAni.keyTimes = @[@0, @0.5, @1];
    scaleAni.values = @[@1, @0.6, @1];
    //Animation group
    CAAnimationGroup* aniGroup = [CAAnimationGroup new];
    aniGroup.animations = @[rotateAni, scaleAni];
    aniGroup.duration = duration;
    aniGroup.repeatCount = HUGE;
    aniGroup.removedOnCompletion = NO;
    
    //Draw shape
    CGSize circleSize = CGSizeMake(self.radius, self.radius);
    CALayer* circle = [CAShapeLayer circleThirdFourShapeLayer:circleSize color:color.CGColor];
    [circle addAnimation:aniGroup forKey:@"animation"];
    
    //Add subLayer
    circle.frame = CGRectMake(0, 0, circleSize.width, circleSize.height);
    [layer addSublayer:circle];
}
@end

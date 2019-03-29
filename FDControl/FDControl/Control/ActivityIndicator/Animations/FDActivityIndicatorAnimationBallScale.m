//
//  FDActivityIndicatorAnimationBallScale.m
//  FDControl
//
//  Created by zhangyu528 on 2019/1/9.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDActivityIndicatorAnimationBallScale.h"

#import "FDActivityIndicatorShape.h"

@implementation FDActivityIndicatorAnimationBallScale
- (void)setupAnimation:(CALayer*)layer color:(UIColor*)color {
    
    // Scale animation
    CFTimeInterval duration = 1;
    CABasicAnimation* scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = duration;
    scaleAnimation.fromValue = @0;
    scaleAnimation.toValue = @1;
    
    // Opacity animation
    CABasicAnimation* opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = duration;
    opacityAnimation.fromValue = @1;
    opacityAnimation.toValue = @0;
    
    // Animation Group
    CAAnimationGroup* animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[scaleAnimation, opacityAnimation];
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animationGroup.duration = duration;
    animationGroup.repeatCount = HUGE;
    animationGroup.removedOnCompletion = NO;
    
    //Draw circle
    CGFloat ballRadius = layer.bounds.size.width < layer.bounds.size.height?layer.bounds.size.width:layer.bounds.size.height;
    CGSize ballSize = CGSizeMake(ballRadius, ballRadius);
    CALayer* ball = [FDActivityIndicatorShape getBallWith:ballSize color:color];
    ball.frame = CGRectMake(0, 0,
                              ballSize.width, ballSize.height);
    // Add animation
    [ball addAnimation:animationGroup forKey:@"animation"];
    [layer addSublayer:ball];
}
@end

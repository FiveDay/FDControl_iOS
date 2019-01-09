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
- (void)setupAnimation:(CALayer*) layer size:(CGSize)size color:(UIColor*)color {
    CFTimeInterval duration = 1;
    
    // Scale animation
    CABasicAnimation* scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = duration;
    scaleAnimation.fromValue = @0;
    scaleAnimation.toValue = @1;
    
    // Opacity animation
    CABasicAnimation* opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = duration;
    opacityAnimation.fromValue = @0;
    opacityAnimation.toValue = @1;
    
    // Animation Group
    CAAnimationGroup* animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[scaleAnimation, opacityAnimation];
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animationGroup.duration = duration;
    animationGroup.repeatCount = HUGE;
    animationGroup.removedOnCompletion = NO;
    
    //Draw circle
    CALayer* circle = [FDActivityIndicatorShape getCircleWith:size color:color];
    circle.frame = CGRectMake((layer.bounds.size.width - size.width) / 2,
                              (layer.bounds.size.height - size.height) / 2,
                              size.width, size.height);
    // Add animation
    [circle addAnimation:animationGroup forKey:@"animation"];
    [layer addSublayer:circle];
}
@end

//
//  FDActivityIndicatorView.m
//  FDControl
//
//  Created by zhangyu528 on 2019/1/9.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDActivityIndicatorView.h"

#import "FDActivityIndicatorAnimationBallPulse.h"
#import "FDActivityIndicatorAnimationBallGridPulse.h"
#import "FDActivityIndicatorAnimationBallClipRotate.h"
#import "FDActivityIndicatorAnimationBallScale.h"

@interface FDActivityIndicatorView ()
@property(assign, nonatomic)CGFloat radius;
@end


@implementation FDActivityIndicatorView

@synthesize frame = _frame, bounds = _bounds;

- (instancetype)initWithOrign:(CGPoint)orign andBallScaleWithRadius:(CGFloat)radius {
    CGRect frame = CGRectMake(orign.x, orign.y, radius * 2, radius * 2);
    if (self = [super initWithFrame:frame]) {
        _radius = radius;
        _tintColor = [UIColor blueColor];
        _type = ballScale;
    }
    return self;
}

- (instancetype)initWithOrign:(CGPoint)orign andBallPulseWithRadius:(CGFloat)radius {
    CGRect frame = CGRectMake(orign.x, orign.y, radius * 2 * 3 + 4, radius * 2 * 3 + 4);
    if (self = [super initWithFrame:frame]) {
        _radius = radius;
        _tintColor = [UIColor blueColor];
        _type = ballPulse;
    }
    return self;
}

- (instancetype)initWithOrign:(CGPoint)orign andBallGridPulseWithRadius:(CGFloat)radius {
    CGRect frame = CGRectMake(orign.x, orign.y, radius * 2 * 3 + 4, radius * 2 * 3 + 4);
    if (self = [super initWithFrame:frame]) {
        _radius = radius;
        _tintColor = [UIColor blueColor];
        _type = ballGridPulse;
    }
    return self;
}

- (instancetype)initWithOrign:(CGPoint)orign andBallClipRotateRadius:(CGFloat)radius {
    CGRect frame = CGRectMake(orign.x, orign.y, radius * 2, radius * 2);
    if (self = [super initWithFrame:frame]) {
        _radius = radius;
        _type = ballClipRotate;
        _tintColor = [UIColor blueColor];
    }
    return self;
}

- (void)setupAnimation {
    [super setupAnimation];
    
    switch (_type) {
        case ballPulse: {
            _animation = [[FDActivityIndicatorAnimationBallPulse alloc]initWithBallRadius:self.radius];
            [_animation setupAnimation:self.layer color:self.tintColor];
            break;
        }
        case ballGridPulse: {
            _animation = [[FDActivityIndicatorAnimationBallGridPulse alloc]initWithBallRadius:self.radius];
            [_animation setupAnimation:self.layer color:self.tintColor];
            break;
        }
        case ballClipRotate: {
            _animation = [[FDActivityIndicatorAnimationBallClipRotate alloc]initWithRadius:self.radius];
            [_animation setupAnimation:self.layer color:self.tintColor];
            break;
        }
        case ballScale: {
            _animation = [[FDActivityIndicatorAnimationBallScale alloc]initWithBallRadius:self.radius];
            [_animation setupAnimation:self.layer color:self.tintColor];
            break;
        }
        default:
            break;
    }
}

@end

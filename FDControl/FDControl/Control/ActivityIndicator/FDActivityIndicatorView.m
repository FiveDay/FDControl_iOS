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
#import "FDActivityIndicatorAnimationBallScale.h"

@interface FDActivityIndicatorView ()
@property(assign, nonatomic)FDActivityIndicatorType type;
@property(assign, nonatomic)CGFloat radius;
@property(strong, nonatomic, nullable)id animation;
@end

@implementation FDActivityIndicatorView

@synthesize frame = _frame, bounds = _bounds;

- (instancetype)initWithOrign:(CGPoint)orign andBallScaleWithRadius:(CGFloat)radius {
    CGRect frame = CGRectMake(orign.x, orign.y, radius * 2, radius * 2);
    if (self = [super initWithFrame:frame]) {
        _radius = radius;
        self.backgroundColor = [UIColor blueColor];
        self.hidden = YES;
        _tintColor = [UIColor whiteColor];
        _isAnimating = NO;
        _type = ballScale;
    }
    return self;
}

- (instancetype)initWithOrign:(CGPoint)orign andBallPulseWithRadius:(CGFloat)radius {
    CGRect frame = CGRectMake(orign.x, orign.y, radius * 2 * 3 + 4, radius * 2 * 3 + 4);
    if (self = [super initWithFrame:frame]) {
        _radius = radius;
        self.backgroundColor = [UIColor blueColor];
        self.hidden = YES;
        _tintColor = [UIColor whiteColor];
        _isAnimating = NO;
        _type = ballPulse;
    }
    return self;
}

- (instancetype)initWithOrign:(CGPoint)orign andBallGridPulseWithRadius:(CGFloat)radius {
    CGRect frame = CGRectMake(orign.x, orign.y, radius * 2 * 3 + 4, radius * 2 * 3 + 4);
    if (self = [super initWithFrame:frame]) {
        _radius = radius;
        self.backgroundColor = [UIColor blueColor];
        self.hidden = YES;
        _tintColor = [UIColor whiteColor];
        _isAnimating = NO;
        _type = ballGridPulse;
    }
    return self;
}

- (void)startAnimating {
    if (_isAnimating) {
        return;
    }
    [self setupAnimationByType:self.type];
    
    self.hidden = NO;
    _isAnimating = YES;
    self.layer.speed = 1;
}

- (void)stopAnimating {
    if (!_isAnimating) {
        return;
    }
    self.hidden = YES;
    _isAnimating = NO;
    self.layer.speed = 0;
}

- (void)setupAnimationByType:(FDActivityIndicatorType)type {
    if (self.animation) {
        return;
    }
    switch (type) {
        case ballPulse: {
            self.animation = [[FDActivityIndicatorAnimationBallPulse alloc]initWithBallRadius:self.radius];
            [self.animation setupAnimation:self.layer color:self.tintColor];
            break;
        }
        case ballGridPulse: {
            self.animation = [[FDActivityIndicatorAnimationBallGridPulse alloc]initWithBallRadius:self.radius];
            [self.animation setupAnimation:self.layer color:self.tintColor];
            break;
        }
        case ballScale: {
            self.animation = [[FDActivityIndicatorAnimationBallScale alloc]initWithBallRadius:self.radius];
            [self.animation setupAnimation:self.layer color:self.tintColor];
            break;
        }
        default:
            break;
    }
}

@end

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
#import "FDActivityIndicatorAnimationSquareSpin.h"
#import "fdactivityIndicatorAnimationTriangleSkewSpin.h"

@interface FDActivityIndicatorView ()
@end


@implementation FDActivityIndicatorView

+ (instancetype)ballScaleWithRadius:(CGFloat)radius {
    FDActivityIndicatorView* instance = [[self alloc]initWithType:ballScale];
    instance.radius = radius;
    return instance;
}

+ (instancetype)ballPulseWithRadius:(CGFloat)radius {
    FDActivityIndicatorView* instance = [[self alloc]initWithType:ballPulse];
    instance.radius = radius;
    return instance;
}

+ (instancetype)ballGridPulseWithRadius:(CGFloat)radius {
    FDActivityIndicatorView* instance = [[self alloc]initWithType:ballGridPulse];
    instance.radius = radius;
    return instance;
}

+ (instancetype)ballClipRotateRadius:(CGFloat)radius {
    FDActivityIndicatorView* instance = [[self alloc]initWithType:ballClipRotate];
    instance.radius = radius;
    return instance;
}

+ (instancetype)squareSpinWidth:(CGFloat)width {
    FDActivityIndicatorView* instance = [[self alloc]initWithType:squareSpin];
    instance.squareWidth = width;
    return instance;
}

+ (instancetype)triangleSkewSpinWithSize:(CGSize)size {
    FDActivityIndicatorView* instance = [[self alloc]initWithType:triangleSkewSpin];
    instance.triangleSize = size;
    return instance;
}

- (instancetype)initWithType:(FDActivityIndicatorType)type {
    if (self = [super init]) {
        _radius = 20;
        _squareWidth = 30;
        _triangleSize = CGSizeMake(60, 40);
        _tintColor = [UIColor whiteColor];
        _type = type;
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
        case squareSpin: {
            _animation = [[FDActivityIndicatorAnimationSquareSpin alloc]initWithWidth:self.squareWidth];
            [_animation setupAnimation:self.layer color:self.tintColor];
            break;
        }
        case ballScale: {
            _animation = [[FDActivityIndicatorAnimationBallScale alloc]initWithBallRadius:self.radius];
            [_animation setupAnimation:self.layer color:self.tintColor];
            break;
        }
        case triangleSkewSpin: {
            _animation = [[FDActivityIndicatorAnimationTriangleSkewSpin alloc]initWithSize:self.triangleSize];
            [_animation setupAnimation:self.layer color:self.tintColor];
        }
        default:
            break;
    }
}

@end

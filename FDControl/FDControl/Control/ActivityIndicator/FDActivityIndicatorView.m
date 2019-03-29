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
@end

@implementation FDActivityIndicatorView

- (instancetype)initWithFrame:(CGRect)frame type:(FDActivityIndicatorType)type {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        self.hidden = YES;
        _tintColor = [UIColor whiteColor];
        _type = type;
        _isAnimating = NO;

        [self setupAnimationByType:_type];
    }
    return self;
}

- (void)startAnimating {
    if (_isAnimating) {
        return;
    }
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
    
    switch (type) {
        case ballPulse: {
            FDActivityIndicatorAnimationBallPulse* animation = [FDActivityIndicatorAnimationBallPulse new];
            [animation setupAnimation:self.layer color:self.tintColor];
            break;
        }
        case ballGridPulse: {
            FDActivityIndicatorAnimationBallGridPulse* animation = [FDActivityIndicatorAnimationBallGridPulse new];
            [animation setupAnimation:self.layer color:self.tintColor];
            break;
        }
        case ballScale: {
            FDActivityIndicatorAnimationBallScale* animation = [FDActivityIndicatorAnimationBallScale new];
            [animation setupAnimation:self.layer color:self.tintColor];
            break;
        }
        default:
            break;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

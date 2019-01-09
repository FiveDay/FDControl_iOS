//
//  FDActivityIndicatorView.m
//  FDControl
//
//  Created by zhangyu528 on 2019/1/9.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDActivityIndicatorView.h"
#import "FDActivityIndicatorAnimationBallPulse.h"
#import "FDActivityIndicatorAnimationBallScale.h"

@interface FDActivityIndicatorView ()
@property(strong, nonatomic)UIColor* tintColor;
@end

@implementation FDActivityIndicatorView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        _tintColor = [UIColor whiteColor];
        self.hidden = YES;
        _isAnimating = NO;
        self.layer.speed = 0;
        [self setupAnimation];
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

- (void)setupAnimation {
    FDActivityIndicatorAnimationBallScale* animation = [FDActivityIndicatorAnimationBallScale new];
    CGSize size = self.frame.size;
    [animation setupAnimation:self.layer size:size color:_tintColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

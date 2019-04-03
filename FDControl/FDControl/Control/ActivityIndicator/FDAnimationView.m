//
//  FDAnimationView.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/3.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDAnimationView.h"

@implementation FDAnimationView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.hidden = YES;
        _isAnimating = NO;
    }
    return self;
}

- (void)startAnimating {
    if (_isAnimating) {
        return;
    }
    [self setupAnimation];
    
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
    if (_animation) {
        return;
    }
}
@end

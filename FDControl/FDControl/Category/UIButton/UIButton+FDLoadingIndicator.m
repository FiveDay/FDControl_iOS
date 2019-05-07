//
//  UIButton+FDLoadingIndicator.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/7.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "UIButton+FDLoadingIndicator.h"
#import <objc/runtime.h>

@interface UIButton ()
@property(strong, nonatomic)UIActivityIndicatorView* indicator;
@end

@implementation UIButton (FDLoadingIndicator)

- (void)setIndicator:(UIActivityIndicatorView *)indicator {
    objc_setAssociatedObject(self, @selector(indicator), indicator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIActivityIndicatorView*)indicator {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setIsLoading:(BOOL)isLoading {
    objc_setAssociatedObject(self, @selector(isLoading), @(isLoading), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isLoading {
    NSNumber *number = objc_getAssociatedObject(self, _cmd);
    return number.boolValue;
}

- (void)showLoading {
    if (!self.indicator) {
        self.indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    }
    self.indicator.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    if(![self.subviews containsObject:self.indicator]) {
        [self addSubview:self.indicator];
    }
    self.isLoading = YES;
    [self.indicator startAnimating];
    self.titleLabel.alpha = 0;
    self.imageView.hidden = YES;
}

- (void)hideLoading {
    [self.indicator stopAnimating];
    self.isLoading = NO;
    self.titleLabel.alpha = 1;
    self.imageView.hidden = NO;
}
@end

//
//  UIButton+FDConvenientMethod.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/7.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "UIButton+FDConvenientMethod.h"

@implementation UIButton (FDConvenientMethod)

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor*)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setCornerMask:(CACornerMask)cornerMask {
    if (@available(iOS 11.0, *)) {
        self.layer.maskedCorners = cornerMask;
    }
}

- (CACornerMask)cornerMask {
    if (@available(iOS 11.0, *)) {
        return self.layer.maskedCorners;
    }
    return kCALayerMaxXMaxYCorner | kCALayerMaxXMinYCorner | kCALayerMinXMaxYCorner | kCALayerMinXMinYCorner;
}

- (void)setTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateNormal];
}

- (NSString*)title {
    return [self titleForState:UIControlStateNormal];
}

- (void)setTitleColor:(UIColor *)titleColor {
    [self setTitleColor:titleColor forState:UIControlStateNormal];
}

- (UIColor*)titleColor {
    return [self titleColorForState:UIControlStateNormal];
}

- (void)setImage:(UIImage *)image {
    [self setImage:image forState:UIControlStateNormal];
}

- (UIImage*)image {
    return [self imageForState:UIControlStateNormal];
}

- (void)setBackgroundImage:(UIImage *)backgroundImage {
    [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
}

- (UIImage*)backgroundImage {
    return [self backgroundImageForState:UIControlStateNormal];
}
@end

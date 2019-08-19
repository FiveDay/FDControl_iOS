//
//  UIButton+FDChainMethod.m
//  FDControl
//
//  Created by zhangyu528 on 2019/8/19.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "UIButton+FDChainMethod.h"

@implementation UIButton (FDChainMethod)


- (UIButton* (^)(NSString*))normalTitle {
    return ^(NSString* title) {
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton* (^)(NSString*))selectedTitle {
    return ^(NSString* title) {
        [self setTitle:title forState:UIControlStateSelected];
        return self;
    };
}
- (UIButton* (^)(NSString*))highlightedTitle {
    return ^(NSString* title) {
        [self setTitle:title forState:UIControlStateHighlighted];
        return self;
    };
}
- (UIButton* (^)(NSString*))disabledTitle {
    return ^(NSString* title) {
        [self setTitle:title forState:UIControlStateDisabled];
        return self;
    };
}
- (UIButton* (^)(UIColor*))normalTitleColor {
    return ^(UIColor* color) {
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton* (^)(UIColor*))selecteTitleColor {
    return ^(UIColor* color) {
        [self setTitleColor:color forState:UIControlStateSelected];
        return self;
    };
}
- (UIButton* (^)(UIColor*))higlightedTitleColor {
    return ^(UIColor* color) {
        [self setTitleColor:color forState:UIControlStateHighlighted];
        return self;
    };
}
- (UIButton* (^)(UIColor*))disabledTitleColor {
    return ^(UIColor* color) {
        [self setTitleColor:color forState:UIControlStateDisabled];
        return self;
    };
}

- (UIButton* (^)(UIImage*))normalImage {
    return ^(UIImage* image) {
        [self setImage:image forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton* (^)(UIImage*))selectedImage {
    return ^(UIImage* image) {
        [self setImage:image forState:UIControlStateSelected];
        return self;
    };
}
- (UIButton* (^)(UIImage*))highlightedImage {
    return ^(UIImage* image) {
        [self setImage:image forState:UIControlStateHighlighted];
        return self;
    };
}
- (UIButton* (^)(UIImage*))disabledImage {
    return ^(UIImage* image) {
        [self setImage:image forState:UIControlStateDisabled];
        return self;
    };
}
- (UIButton* (^)(UIImage*))normalBackgroundImage {
    return ^(UIImage* image) {
        [self setBackgroundImage:image forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton* (^)(UIImage*))selectedBackgroundImage {
    return ^(UIImage* image) {
        [self setBackgroundImage:image forState:UIControlStateSelected];
        return self;
    };
}
- (UIButton* (^)(UIImage*))highlightedBackgroundImage {
    return ^(UIImage* image) {
        [self setBackgroundImage:image forState:UIControlStateHighlighted];
        return self;
    };
}
- (UIButton* (^)(UIImage*))disabledBackgroundImage {
    return ^(UIImage* image) {
        [self setBackgroundImage:image forState:UIControlStateDisabled];
        return self;
    };
}
@end

//
//  UIView+FlexLayout.m
//  FDControl
//
//  Created by zhangyu528 on 2019/11/1.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "UIView+FlexLayout.h"
#import "FLViewAtrribute.h"
#import <objc/runtime.h>

static const void *kViewAttrributeKey = &kViewAttrributeKey;

@interface UIView ()
@property(nonatomic, readonly, strong)FLViewAtrribute* attribute;
@end

@implementation UIView (FlexLayout)

- (FLRender)renderTo {
    return ^UIView*(UIView* content) {
        [content addSubview:self];
        return self;
    };
}

- (FLViewAtrribute*)attribute {
    FLViewAtrribute* attribute = objc_getAssociatedObject(self, kViewAttrributeKey);
    if (!attribute) {
        attribute = [FLViewAtrribute new];
        objc_setAssociatedObject(self, kViewAttrributeKey, attribute, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return attribute;
}

- (FLColorAttribute)backgroundColor {
    return ^UIView*(UIColor* color) {
        [self setBackgroundColor:color];
        return self;
    };
}

- (FLPaddingAttribute)padding {
    return ^UIView*(NSNumber* top, ...) {
        
        va_list args;
        va_start(args, top);
        NSNumber* right = @0;
        NSNumber* bottom = @0;
        NSNumber* left = @0;
        NSNumber* value;
        
        value = va_arg(args, NSNumber*);//right
        if (![value isKindOfClass:[NSNumber class]]) {
            left = bottom = right = top;
            va_end(args);
            self.attribute.padding_top = top;
            self.attribute.padding_right = right;
            self.attribute.padding_bottom = bottom;
            self.attribute.padding_left = left;
            return self;
        }
        right = value;
        
        value = va_arg(args, NSNumber*);
        if (![value isKindOfClass:[NSNumber class]]) {
            va_end(args);
            self.attribute.padding_top = top;
            self.attribute.padding_right = right;
            self.attribute.padding_bottom = bottom;
            self.attribute.padding_left = left;
            return self;
        }
        bottom = value;
        value = va_arg(args, NSNumber*);
        if (![value isKindOfClass:[NSNumber class]]) {
            va_end(args);
            self.attribute.padding_top = top;
            self.attribute.padding_right = right;
            self.attribute.padding_bottom = bottom;
            self.attribute.padding_left = left;
            return self;
        }
        left = value;
        va_end(args);
        self.attribute.padding_top = top;
        self.attribute.padding_right = right;
        self.attribute.padding_bottom = bottom;
        self.attribute.padding_left = left;
        return self;
    };
}

- (FLMarginAttribute)margin {
    return ^UIView*(NSNumber* top, ...) {
        va_list args;
        va_start(args, top);
        NSNumber* right = @0;
        NSNumber* bottom = @0;
        NSNumber* left = @0;
        NSNumber* value;
        value = va_arg(args, NSNumber*);
        if (![value isKindOfClass:[NSNumber class]]) {
            left = bottom = right = top;
            va_end(args);
            self.attribute.margin_top = top;
            self.attribute.margin_right = right;
            self.attribute.margin_bottom = bottom;
            self.attribute.margin_left = left;
            return self;
        }
        right = value;
        value = va_arg(args, NSNumber*);
        if (![value isKindOfClass:[NSNumber class]]) {
            va_end(args);
            self.attribute.margin_top = top;
            self.attribute.margin_right = right;
            self.attribute.margin_bottom = bottom;
            self.attribute.margin_left = left;
            return self;
        }
        bottom = value;
        value = va_arg(args, NSNumber*);
        if (![value isKindOfClass:[NSNumber class]]) {
            va_end(args);
            self.attribute.margin_top = top;
            self.attribute.margin_right = right;
            self.attribute.margin_bottom = bottom;
            self.attribute.margin_left = left;
            return self;
        }
        left = value;
        va_end(args);
        self.attribute.margin_top = top;
        self.attribute.margin_right = right;
        self.attribute.margin_bottom = bottom;
        self.attribute.margin_left = left;
        return self;
    };
}


@end

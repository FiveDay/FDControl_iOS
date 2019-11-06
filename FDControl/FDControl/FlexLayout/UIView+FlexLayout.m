//
//  UIView+FlexLayout.m
//  FDControl
//
//  Created by zhangyu528 on 2019/11/1.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "UIView+FlexLayout.h"
#import "FLViewLayout.h"
#import <objc/runtime.h>

static const void *kViewLayoutKey = &kViewLayoutKey;

@interface UIView ()
@property(nonatomic, readonly, strong) FLViewLayout* layout;
@end

@implementation UIView (FlexLayout)

- (FLRender)renderTo {
    return ^UIView*(UIView* content) {
        [content addSubview:self];
        NSUInteger index = [[content subviews]count] - 1;
        [content.layout insertChild:self index:index];
        return self;
    };
}

- (FLViewLayout*)layout {
    FLViewLayout* layout = objc_getAssociatedObject(self, kViewLayoutKey);
    if (!layout) {
        layout = [[FLViewLayout alloc]initWithView:self];
        objc_setAssociatedObject(self, kViewLayoutKey, layout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return layout;
}

- (FLColorAttribute)backgroundColor {
    return ^UIView*(UIColor* color) {
        [self setBackgroundColor:color];
        return self;
    };
}

//layout
- (FLWidthAttribute)width {
    return ^UIView*(CGFloat width) {
        self.layout.width = width;
        return self;
    };
}

- (FLHeightAttribute)height {
    return ^UIView*(CGFloat height) {
        self.layout.height = height;
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
            self.layout.padding_top = top;
            self.layout.padding_right = right;
            self.layout.padding_bottom = bottom;
            self.layout.padding_left = left;
            return self;
        }
        right = value;
        
        value = va_arg(args, NSNumber*);
        if (![value isKindOfClass:[NSNumber class]]) {
            va_end(args);
            self.layout.padding_top = top;
            self.layout.padding_right = right;
            self.layout.padding_bottom = bottom;
            self.layout.padding_left = left;
            return self;
        }
        bottom = value;
        value = va_arg(args, NSNumber*);
        if (![value isKindOfClass:[NSNumber class]]) {
            va_end(args);
            self.layout.padding_top = top;
            self.layout.padding_right = right;
            self.layout.padding_bottom = bottom;
            self.layout.padding_left = left;
            return self;
        }
        left = value;
        va_end(args);
        self.layout.padding_top = top;
        self.layout.padding_right = right;
        self.layout.padding_bottom = bottom;
        self.layout.padding_left = left;
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
            self.layout.margin_top = top;
            self.layout.margin_right = right;
            self.layout.margin_bottom = bottom;
            self.layout.margin_left = left;
            return self;
        }
        right = value;
        value = va_arg(args, NSNumber*);
        if (![value isKindOfClass:[NSNumber class]]) {
            va_end(args);
            self.layout.margin_top = top;
            self.layout.margin_right = right;
            self.layout.margin_bottom = bottom;
            self.layout.margin_left = left;
            return self;
        }
        bottom = value;
        value = va_arg(args, NSNumber*);
        if (![value isKindOfClass:[NSNumber class]]) {
            va_end(args);
            self.layout.margin_top = top;
            self.layout.margin_right = right;
            self.layout.margin_bottom = bottom;
            self.layout.margin_left = left;
            return self;
        }
        left = value;
        va_end(args);
        self.layout.margin_top = top;
        self.layout.margin_right = right;
        self.layout.margin_bottom = bottom;
        self.layout.margin_left = left;
        return self;
    };
}


@end

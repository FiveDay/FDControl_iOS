//
//  UIView+Layout.m
//  FDControl
//
//  Created by zhangyu528 on 2019/11/1.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "UIView+Layout.h"
#import "FLViewLayout.h"
#import "FLVStack.h"
#import <objc/runtime.h>

static const void *kViewLayoutKey = &kViewLayoutKey;

@interface UIView ()
@property(nonatomic, readonly, strong) FLViewLayout* layout;
@end

@implementation UIView (FlexLayout)

+ (void)load {
    Method method1 = class_getInstanceMethod(self.class, @selector(layoutSubviews));
    Method method2 = class_getInstanceMethod(self.class, @selector(fl_layoutSubviews));
    method_exchangeImplementations(method1, method2);
}

- (FLLayout)layoutTo {
    return ^UIView*(UIView* content) {
        [content addSubview:self];
        NSUInteger newIndex = [content.layout getChildCount];
        [content.layout insertChild:self index:newIndex];
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

- (BOOL)isLayout {
    FLViewLayout* layout = objc_getAssociatedObject(self, kViewLayoutKey);
    if (layout) {
        return YES;
    }else{
        return NO;
    }
}

- (void)fl_layoutSubviews {
    [self fl_layoutSubviews];
    
    FLViewLayout* layout = objc_getAssociatedObject(self, kViewLayoutKey);
    
    if ([layout.view isKindOfClass:[FLVStack class]]&&![[layout.view superview]isLayout]) {
        [layout applyLayout];
    } else if (layout) {
        [layout getLayout];
    }
}

//layout
- (FLSize)size {
    return ^UIView*(CGFloat width, CGFloat height) {
        self.layout.width = width;
        self.layout.height = height;
        return self;
    };
}

- (FLPadding)padding {
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

//- (FLMargin)margin {
//    return ^UIView*(NSNumber* top, ...) {
//        va_list args;
//        va_start(args, top);
//        NSNumber* right = @0;
//        NSNumber* bottom = @0;
//        NSNumber* left = @0;
//        NSNumber* value;
//        value = va_arg(args, NSNumber*);
//        if (![value isKindOfClass:[NSNumber class]]) {
//            left = bottom = right = top;
//            va_end(args);
//            self.layout.margin_top = top;
//            self.layout.margin_right = right;
//            self.layout.margin_bottom = bottom;
//            self.layout.margin_left = left;
//            return self;
//        }
//        right = value;
//        value = va_arg(args, NSNumber*);
//        if (![value isKindOfClass:[NSNumber class]]) {
//            va_end(args);
//            self.layout.margin_top = top;
//            self.layout.margin_right = right;
//            self.layout.margin_bottom = bottom;
//            self.layout.margin_left = left;
//            return self;
//        }
//        bottom = value;
//        value = va_arg(args, NSNumber*);
//        if (![value isKindOfClass:[NSNumber class]]) {
//            va_end(args);
//            self.layout.margin_top = top;
//            self.layout.margin_right = right;
//            self.layout.margin_bottom = bottom;
//            self.layout.margin_left = left;
//            return self;
//        }
//        left = value;
//        va_end(args);
//        self.layout.margin_top = top;
//        self.layout.margin_right = right;
//        self.layout.margin_bottom = bottom;
//        self.layout.margin_left = left;
//        return self;
//    };
//}


@end

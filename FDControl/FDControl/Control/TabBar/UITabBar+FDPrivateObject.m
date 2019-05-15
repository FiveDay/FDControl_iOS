//
//  UITabBar+FDPrivateObject.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/15.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "UITabBar+FDPrivateObject.h"
#import <objc/runtime.h>


@interface UITabBar ()
@property(strong, nonatomic, nullable)NSArray* tabBarButtons;
@end

@implementation UITabBar (FDPrivateObject)

- (void)setTabBarButtons:(NSArray *)tabBarButtons {
    objc_setAssociatedObject(self, @selector(tabBarButtons), tabBarButtons, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray*)tabBarButtons {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)enumerateTabBarButtonUsingBlock:(void (^)(UIView* btn))block {
    if (self.tabBarButtons) {
        [self.tabBarButtons enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (block) {
                block(obj);
            }
        }];
    }else {
        NSMutableArray* btns = [NSMutableArray new];
        for (UIView* subView in self.subviews) {
            if ([subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                [btns addObject:subView];
                if (block) {
                    block(subView);
                }
            }
        }
        self.tabBarButtons = [btns copy];
    }
}
- (NSArray*)queryUITabBarButtons {
    if (self.tabBarButtons) {
        return self.tabBarButtons;
    }
    
    NSMutableArray* btns = [NSMutableArray new];
    for (UIView* subView in self.subviews) {
        if ([subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [btns addObject:subView];
        }
    }
    self.tabBarButtons = [btns copy];
    return self.tabBarButtons;
}

- (UIImageView*)queryUITabBarSwappableImageView:(UIView*)tabBarButton {
    for (UIView* subView in tabBarButton.subviews) {
        if ([subView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            return (UIImageView*)subView;
        }
    }
    return nil;
}
@end

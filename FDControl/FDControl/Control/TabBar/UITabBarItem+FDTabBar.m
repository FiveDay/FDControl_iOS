//
//  UITabBarItem+FDTabBar.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/10.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "UITabBarItem+FDTabBar.h"
#import <objc/runtime.h>

@implementation UITabBarItem (FDTabBar)

- (void)setAnimation:(CAKeyframeAnimation *)animation {
    objc_setAssociatedObject(self, @selector(animation), animation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CAKeyframeAnimation*)animation {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setSelectedBgColor:(UIColor *)selectedBgColor {
    objc_setAssociatedObject(self, @selector(selectedBgColor), selectedBgColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor*)selectedBgColor {
    return objc_getAssociatedObject(self, _cmd);
}
@end

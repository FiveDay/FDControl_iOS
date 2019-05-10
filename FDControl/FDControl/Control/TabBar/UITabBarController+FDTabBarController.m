//
//  UITabBarController+FDTabBarController.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/10.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "UITabBarController+FDTabBarController.h"
#import <objc/runtime.h>
#import "FDTabBar.h"

@interface  UITabBarController()
@property(strong, nonatomic, nullable)FDTabBar* tabBar;
@end

@implementation UITabBarController (FDTabBarController)

+ (void)load {
    Method originalM = class_getInstanceMethod([self class], @selector(viewDidLoad));
    Method exchangeM = class_getInstanceMethod([self class], @selector(fd_viewDidLoad));
    /** 交换方法 */
    method_exchangeImplementations(originalM, exchangeM);
}

- (void)fd_viewDidLoad {
    [self fd_viewDidLoad];
    
    self.tabBar = [FDTabBar new];
}

- (void)setPlusButton:(UIButton *)plusButton {
    ((FDTabBar*)self.tabBar).plusButton = plusButton;
}

- (UIButton *)plusButton {
    return  ((FDTabBar*)self.tabBar).plusButton;
}
@end

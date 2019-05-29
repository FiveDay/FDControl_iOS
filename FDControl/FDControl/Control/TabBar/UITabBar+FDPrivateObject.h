//
//  UITabBar+FDPrivateObject.h
//  FDControl
//
//  Created by zhangyu528 on 2019/5/15.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBar (FDPrivateObject)

- (NSArray*)queryUITabBarButtons;
- (void)enumerateTabBarButtonUsingBlock:(void (^)(UIView* btn))block;

- (UIImageView* _Nullable)queryUITabBarSwappableImageView:(UIView*)tabBarButton;

@end

NS_ASSUME_NONNULL_END

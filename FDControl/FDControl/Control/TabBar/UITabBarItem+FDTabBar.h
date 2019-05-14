//
//  UITabBarItem+FDTabBar.h
//  FDControl
//
//  Created by zhangyu528 on 2019/5/10.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBarItem (FDTabBar)
@property(strong, nonatomic, nullable)NSArray<UIImage*>* animationImages;
@property(strong, nonatomic, nullable)CAAnimation* animation;
@property(strong, nonatomic, nullable)UIColor* selectedBgColor;
@property(assign, nonatomic)BOOL isShowDot;
@property(strong, nonatomic)UIColor* dotColor;
@end

NS_ASSUME_NONNULL_END

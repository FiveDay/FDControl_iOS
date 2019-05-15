//
//  FDTabBar.h
//  FDControl
//
//  Created by zhangyu528 on 2019/5/9.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FDTabBar : UITabBar
@property(strong, nonatomic, nullable)UIButton* plusButton;
@property(strong, nonatomic, nullable)NSArray<CAAnimation*>* tabBarButtonAnimations;
@end

NS_ASSUME_NONNULL_END

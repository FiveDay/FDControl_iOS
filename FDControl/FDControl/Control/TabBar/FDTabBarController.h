//
//  FDTabBarController.h
//  FDControl
//
//  Created by zhangyu528 on 2019/5/9.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    TabBarDefaultType,
    TabBarMidButtonType,
} FDTabBarType;

@interface FDTabBarController : UITabBarController

@property(strong, nonatomic, nullable, readonly)UIButton* midButton;

- (instancetype)initWithType:(FDTabBarType)type;

@end

NS_ASSUME_NONNULL_END

//
//  FDPopMenu.h
//  FDControl
//
//  Created by zhangyu528 on 2019/1/16.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FDPopMenuItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface FDPopMenu : NSObject

+ (void)addPopMenuItem:(FDPopMenuItem*)item;

+ (void)showInView:(UIView*)view;

@end

NS_ASSUME_NONNULL_END

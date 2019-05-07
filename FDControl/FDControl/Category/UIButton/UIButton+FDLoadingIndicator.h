//
//  UIButton+FDLoadingIndicator.h
//  FDControl
//
//  Created by zhangyu528 on 2019/5/7.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (FDLoadingIndicator)

@property(assign, nonatomic)BOOL isLoading;

- (void)showLoading;
- (void)hideLoading;

@end

NS_ASSUME_NONNULL_END

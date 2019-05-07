//
//  UIControl+FDTargetAction.h
//  FDControl
//
//  Created by zhangyu528 on 2019/5/6.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^OnClickBlock)(UIControl* sender);

@interface UIControl (FDTargetAction)
@property(strong, nonatomic)OnClickBlock onClick;
@end

NS_ASSUME_NONNULL_END

//
//  FLHStack.h
//  FDControl
//
//  Created by zhangyu528 on 2019/10/31.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLPublicHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface FLHStack : UIView

- (instancetype)initWithAlignement:(FLAlignment)alignment;
- (void)layout:(void(^)(FLHStack* stack))block;

@end

NS_ASSUME_NONNULL_END

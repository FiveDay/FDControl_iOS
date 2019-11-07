//
//  FLVStack.h
//  FDControl
//
//  Created by zhangyu528 on 2019/10/31.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLStack.h"

@class FLVStack;

typedef enum : NSUInteger {
    FLHorizontalAlignmentLeading = 1,
    FLHorizontalAlignmentCenter = 2,
    FLHorizontalAlignmentTrailing = 3,
} FLHorizontalAlignment;

NS_ASSUME_NONNULL_BEGIN

@interface FLVStack : FLStack

- (instancetype)init:(FLHorizontalAlignment)alignment content:(void(^)(UIView* content))content;

- (void)applyLayout;
@end

NS_ASSUME_NONNULL_END

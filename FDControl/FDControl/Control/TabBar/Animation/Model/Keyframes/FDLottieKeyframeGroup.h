//
//  FDLottieKeyframeGroup.h
//  FDControl
//
//  Created by zhangyu528 on 2019/5/22.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FDLottieKeyframe.h"

NS_ASSUME_NONNULL_BEGIN

@interface FDLottieKeyframeGroup <__covariant T> : NSObject

- (instancetype)initWithKeyframes:(NSArray<FDLottieKeyframe<id>*>*)keyframes;
- (instancetype)initWithValue:(T)value;

@end

NS_ASSUME_NONNULL_END

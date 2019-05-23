//
//  FDLottieKeyframe.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/22.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDLottieKeyframe.h"

@implementation FDLottieKeyframe

- (instancetype)initWithValue:(id)value {
    if (self = [super init]) {
        _value = value;
        _time = 0;
        _isHold = YES;
        _inTangent = nil;
        _outTangent = nil;
    }
    return self;
}
@end

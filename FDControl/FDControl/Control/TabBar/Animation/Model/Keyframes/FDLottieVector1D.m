//
//  FDLottieVector1D.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/23.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDLottieVector1D.h"

@implementation FDLottieVector1D
{
    double _value;
}

- (instancetype)initWithValue:(double)value {
    if (self = [super init]) {
        _value = value;
    }
    return self;
}
@end

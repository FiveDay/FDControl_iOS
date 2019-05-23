//
//  FDLottieVector2D.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/22.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDLottieVector2D.h"

@implementation FDLottieVector2D
{
    double _x;
    double _y;
}

- (instancetype)init:(double) x y:(double)y {
    if (self = [super init]) {
        _x = x;
        _y = y;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _x = [aDecoder decodeDoubleForKey:@"x"];
        _y = [aDecoder decodeDoubleForKey:@"y"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
}
@end

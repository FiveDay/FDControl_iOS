//
//  FDLottieVector3D.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/22.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDLottieVector3D.h"

@implementation FDLottieVector3D
{
    double _x;
    double _y;
    double _z;
}

- (instancetype)init:(double)x y:(double)y z:(double)z {
    if (self = [super init]) {
        _x = x;
        _y = y;
        _z = z;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        
    }
    return self;
}
@end

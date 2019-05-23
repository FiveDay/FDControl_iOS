//
//  FDLottieKeyframeGroup.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/22.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDLottieKeyframeGroup.h"

@interface FDLottieKeyframeGroup ()
@end

@implementation FDLottieKeyframeGroup

- (instancetype)initWithKeyframes:(NSArray<FDLottieKeyframe<id>*>*)keyframes {
    if (self = [super init]) {
        _keyframes = keyframes;
    }
    return self;
}

- (instancetype)initWithValue:(id)value {
    if (self = [super init]) {
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        id keyframeData = [aDecoder decodeObjectForKey:@"k"];
        FDLottieKeyframe* keyframe = [[FDLottieKeyframe alloc]initWithValue:keyframeData];
        _keyframes = @[keyframe];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
}
@end

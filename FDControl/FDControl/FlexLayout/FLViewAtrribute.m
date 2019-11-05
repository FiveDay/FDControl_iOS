//
//  FLViewAtrribute.m
//  FDControl
//
//  Created by zhangyu528 on 2019/11/1.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FLViewAtrribute.h"
#import "Yoga.h"

static YGConfigRef globalConfig;

@interface FLViewAtrribute ()
@property(nonatomic, assign)YGNodeRef node;
@end

@implementation FLViewAtrribute

+ (void)initialize {
    globalConfig = YGConfigNew();
    YGConfigSetExperimentalFeatureEnabled(globalConfig, YGExperimentalFeatureWebFlexBasis, true);
    YGConfigSetPointScaleFactor(globalConfig, [UIScreen mainScreen].scale);
}

- (instancetype)initWithView:(UIView*)view {
    if (self = [super init]) {
        _node = YGNodeNewWithConfig(globalConfig);
        YGNodeSetContext(_node, (__bridge void *) view);
    }
    return self;
}

- (void)dealloc {
    YGNodeFree(self.node);
}
@end

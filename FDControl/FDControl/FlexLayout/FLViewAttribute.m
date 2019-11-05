//
//  FLViewAttribute.m
//  FDControl
//
//  Created by zhangyu528 on 2019/11/1.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FLViewAttribute.h"
#import "Yoga.h"

static YGConfigRef globalConfig;

@interface FLViewAttribute ()
@property(nonatomic, assign)YGNodeRef node;
@property(nonatomic, strong)UIView* view;
@end

@implementation FLViewAttribute

+ (void)initialize {
    globalConfig = YGConfigNew();
    YGConfigSetExperimentalFeatureEnabled(globalConfig, YGExperimentalFeatureWebFlexBasis, true);
    YGConfigSetPointScaleFactor(globalConfig, [UIScreen mainScreen].scale);
}

- (instancetype)initWithView:(UIView*)view {
    if (self = [super init]) {
        _node = YGNodeNewWithConfig(globalConfig);
        YGNodeSetContext(_node, (__bridge void *) view);
        _view = view;
    }
    return self;
}

- (void)setFlexDirection:(FLFlexDirection)flexDirection {
    YGNodeStyleSetFlexDirection(self.node, (YGFlexDirection)flexDirection);
}

- (void)setAlign:(FLAlign)align {
    YGNodeStyleSetAlignContent(self.node, (YGAlign)align);
}

- (void)dealloc {
    YGNodeFree(self.node);
}

- (void)applyLayout {
    const YGNodeRef node = self.node;
    YGNodeCalculateLayout(
                          node,
                          self.view.frame.size.width,
                          self.view.frame.size.height,
                          YGNodeStyleGetDirection(node));
}

@end

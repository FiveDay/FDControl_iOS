//
//  FLViewLayout.m
//  FDControl
//
//  Created by zhangyu528 on 2019/11/1.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FLViewLayout.h"
#import "Yoga.h"

@interface UIView ()
@property(nonatomic, readonly, strong)FLViewLayout* layout;
@end

static YGConfigRef globalConfig;

@interface  FLViewLayout ()
@property(nonatomic, assign)YGNodeRef node;
@property(nonatomic, strong)UIView* view;
@end

@implementation  FLViewLayout

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

- (void)setAlignItems:(FLAlign)align {
    YGNodeStyleSetAlignItems(self.node, (YGAlign)align);
}

- (void)setWidth:(CGFloat)width {
    YGNodeStyleSetWidth(self.node, width);
}

- (void)setHeight:(CGFloat)height {
    YGNodeStyleSetHeight(self.node, height);
}

- (void)dealloc {
    YGNodeFree(self.node);
}

- (void)insertChild:(UIView*)child index:(NSUInteger)index {
    YGNodeInsertChild(self.node, child.layout.node, (uint32_t)index);
}

- (NSUInteger)getChildCount {
    return YGNodeGetChildCount(self.node);
}

- (void)applyLayout {
    const YGNodeRef node = self.node;
    YGNodeCalculateLayout(
                          node,
                          self.view.frame.size.width,
                          self.view.frame.size.height,
                          YGNodeStyleGetDirection(node));

    const CGPoint topLeft = {
        YGNodeLayoutGetLeft(node),
        YGNodeLayoutGetTop(node),
    };
    self.view.frame = (CGRect) {
        .origin = {
            .x = topLeft.x,
            .y = topLeft.y,
        },
        .size = {
            .width = YGNodeLayoutGetWidth(node),
            .height = YGNodeLayoutGetHeight(node),
        }
    };
    uint32_t count = YGNodeGetChildCount(node);
    for (uint32_t index = 0; index < count; index++) {
        const YGNodeRef childNode = YGNodeGetChild(node, index);
        UIView* child = (__bridge UIView *)(YGNodeGetContext(childNode));
        const CGPoint topLeft = {
            YGNodeLayoutGetLeft(child.layout.node),
            YGNodeLayoutGetTop(child.layout.node),
        };
        const CGPoint bottomRight = {
            topLeft.x + YGNodeLayoutGetWidth(child.layout.node),
            topLeft.y + YGNodeLayoutGetHeight(child.layout.node),
        };
        const CGPoint origin = CGPointZero;
        child.frame = (CGRect) {
            .origin = {
                .x = topLeft.x + origin.x,
                .y = topLeft.y + origin.y,
            },
            .size = {
                .width = bottomRight.x - topLeft.x,
                .height = bottomRight.y - topLeft.y,
            },
        };
        [self applyChildLayout:childNode];
    }
}

- (void)applyChildLayout:(YGNodeRef)node {
    uint32_t count = YGNodeGetChildCount(node);
    for (uint32_t index = 0; index < count; index++) {
        const YGNodeRef childNode = YGNodeGetChild(node, index);
        UIView* child = (__bridge UIView *)(YGNodeGetContext(childNode));
        const CGPoint topLeft = {
            YGNodeLayoutGetLeft(child.layout.node),
            YGNodeLayoutGetTop(child.layout.node),
        };
        const CGPoint bottomRight = {
            topLeft.x + YGNodeLayoutGetWidth(child.layout.node),
            topLeft.y + YGNodeLayoutGetHeight(child.layout.node),
        };
        const CGPoint origin = CGPointZero;
        child.frame = (CGRect) {
            .origin = {
                .x = topLeft.x + origin.x,
                .y = topLeft.y + origin.y,
            },
            .size = {
                .width = bottomRight.x - topLeft.x,
                .height = bottomRight.y - topLeft.y,
            },
        };
        [self applyChildLayout:childNode];
    }
}
@end

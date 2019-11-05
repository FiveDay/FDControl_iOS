//
//  FLVStack.m
//  FDControl
//
//  Created by zhangyu528 on 2019/10/31.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FLVStack.h"

@interface UIView ()
@property(nonatomic, readonly, strong)FLViewAttribute* attribute;
@end

@interface FLVStack ()
@property(strong, nonatomic)UIView* contentView;
@end

@implementation FLVStack

- (instancetype)init {
    if (self = [super init]) {
        _contentView = [UIView new];
        _contentView.bounds = self.bounds;
        self.attribute.flexDirection = FLFlexDirectionColumn;
        self.attribute.align = FLAlignFlexStart;
    }
    return self;
}

- (FLAlignBlock)alignment {
    return ^FLVStack*(FLAlign alignment) {
        self.attribute.align = alignment;
        return self;
    };
}

- (FLVStack*)contentView:(void(^)(UIView* content))block {
    block(self.contentView);
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.contentView.bounds = self.bounds;
}

@end

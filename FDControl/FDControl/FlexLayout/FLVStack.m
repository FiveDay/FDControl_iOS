//
//  FLVStack.m
//  FDControl
//
//  Created by zhangyu528 on 2019/10/31.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FLVStack.h"

@interface UIView ()
@property(nonatomic, readonly, strong) FLViewLayout* layout;
@end

@interface FLVStack ()
@end

@implementation FLVStack

- (instancetype)init {
    if (self = [super init]) {
        self.layout.flexDirection = FLFlexDirectionColumn;
        self.layout.align = FLAlignFlexStart;
    }
    return self;
}

- (FLAlignBlock)alignment {
    return ^FLVStack*(FLAlign alignment) {
        self.layout.align = alignment;
        return self;
    };
}

- (FLVStack*)contentView:(void(^)(UIView* content))block {
    block(self);
    return self;
}

- (void)applyLayout {
    [self.layout applyLayout];
}
@end

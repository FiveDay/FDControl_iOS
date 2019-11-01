//
//  FLVStack.m
//  FDControl
//
//  Created by zhangyu528 on 2019/10/31.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FLVStack.h"

@interface FLVStack ()
@property(strong, nonatomic)UIView* contentView;
@property(assign, nonatomic)FLAlignment align;
@end

@implementation FLVStack

- (instancetype)init {
    if (self = [super init]) {
        _align = FL_leading;
        _contentView = [UIView new];
        _contentView.bounds = self.bounds;
    }
    return self;
}

- (FLAlign)alignment {
    return ^FLVStack*(FLAlignment alignment) {
        self.align = alignment;
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
    
    switch (self.align) {
        case FL_leading:
            [self layoutByLeading];
            break;
        case FL_center:
            [self layoutByCenter];
        case FL_end:
            [self layoutByEnd];
        default:
            break;
    }
}

- (void)layoutByLeading {
}

- (void)layoutByCenter {
}

- (void)layoutByEnd {
}


@end

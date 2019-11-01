//
//  FLVStack.m
//  FDControl
//
//  Created by zhangyu528 on 2019/10/31.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FLVStack.h"

@interface FLVStack ()
@property(assign, nonatomic)FLAlignment alignment;
@end

@implementation FLVStack

- (instancetype)initWithAlignement:(FLAlignment)alignment {
    if (self = [super init]) {
        _alignment = alignment;
    }
    return self;
}

- (void)contentView:(void(^)(FLVStack* stack))block {
    
    block(self);
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    switch (self.alignment) {
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

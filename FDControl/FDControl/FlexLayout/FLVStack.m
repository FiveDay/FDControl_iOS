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

- (void)layout:(void(^)(FLVStack* stack))block {
    
    block(self);
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

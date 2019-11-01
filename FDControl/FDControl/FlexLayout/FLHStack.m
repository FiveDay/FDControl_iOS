//
//  FLHStack.m
//  FDControl
//
//  Created by zhangyu528 on 2019/10/31.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FLHStack.h"

@interface FLHStack ()
@property(assign, nonatomic)FLAlignment alignment;
@end

@implementation FLHStack

- (instancetype)initWithAlignement:(FLAlignment)alignment {
    if (self = [super init]) {
        _alignment = alignment;
    }
    return self;
}

- (void)contentView:(void(^)(FLHStack* stack))block {
    
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

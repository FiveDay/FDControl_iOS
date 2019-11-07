//
//  FLVStack.m
//  FDControl
//
//  Created by zhangyu528 on 2019/10/31.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FLVStack.h"
#import "FLViewLayout.h"

@interface UIView ()
@property(nonatomic, readonly, strong) FLViewLayout* layout;
@end

@interface FLVStack ()
@end

@implementation FLVStack

- (instancetype)init:(FLHorizontalAlignment)alignment content:(void(^)(UIView* content))content {
    if (self = [super init]) {
        self.layout.flexDirection = FLFlexDirectionColumn;
        self.layout.alignItems = (FLAlign)alignment;
        content(self);
    }
    return self;
}

- (void)applyLayout {
    [self.layout applyLayout];
}
@end

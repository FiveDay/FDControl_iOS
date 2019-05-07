//
//  UIControl+FDTargetAction.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/6.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "UIControl+FDTargetAction.h"
#import <objc/runtime.h>

@implementation UIControl (FDTargetAction)

- (void)setOnClick:(OnClickBlock)onClick {
    [self addTarget:self action:@selector(onTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
    objc_setAssociatedObject(self, @selector(onClick), onClick, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (OnClickBlock)onClick {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)onTouchUpInside {
    self.onClick(self);
}
@end

//
//  UIViewController+FDRouter.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/17.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "UIViewController+FDRouter.h"
#import <objc/runtime.h>

@implementation UIViewController (FDRouter)

static char kAssociatedParamsObjectKey;

+ (instancetype) viewControllerWithParam:(NSDictionary*)param {
    return [self new];
}

- (void)setParams:(NSDictionary *)paramsDictionary
{
    objc_setAssociatedObject(self, &kAssociatedParamsObjectKey, paramsDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDictionary *)params
{
    return objc_getAssociatedObject(self, &kAssociatedParamsObjectKey);
}
@end

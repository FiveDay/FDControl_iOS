//
//  UINavigationController+FDRouter.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/16.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "UINavigationController+FDRouter.h"
#import "FDRouter.h"

@implementation UINavigationController (FDRouter)

+ (void)installRoutes:(NSSet<FDNavigationRouterRegParam*>*)routes {
    [[FDRouter shared]installRoutes:routes];
}

- (void)navTo:(NSString*)path {
    Class cls = [[FDRouter shared]navTo:path];
    UIViewController* viewCtl = [cls new];
    [self pushViewController:viewCtl animated:YES];
}

@end

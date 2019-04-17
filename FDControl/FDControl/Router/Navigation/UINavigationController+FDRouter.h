//
//  UINavigationController+FDRouter.h
//  FDControl
//
//  Created by zhangyu528 on 2019/4/16.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FDRouterRegParam.h"

@interface FDNavigationRouterRegParam : FDRouterRegParam

@end

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (FDRouter)

+ (void)registerRoutes:(NSSet<FDNavigationRouterRegParam*>*)routes;

- (void)navTo:(NSString*)path;
- (void)navToUrl:(NSURL*)url;
- (void)navToName:(NSString*)name param:(nullable NSDictionary*)param;

@end

NS_ASSUME_NONNULL_END

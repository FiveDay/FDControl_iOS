//
//  FDRouter.h
//  FDControl
//
//  Created by zhangyu528 on 2019/4/15.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FDRouterRegParam.h"

typedef void(^FDRouterHandle)(_Nullable Class component, NSDictionary* _Nullable  params);

NS_ASSUME_NONNULL_BEGIN

@interface FDRouter : NSObject

+ (instancetype)new UNAVAILABLE_ATTRIBUTE;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;

+ (instancetype)shared;

- (void)registerRoutes:(NSSet<FDRouterRegParam*>*)routes;

- (void)navTo:(NSString*)path handle:(nullable FDRouterHandle)handle;
- (void)navToUrl:(NSURL*)url handle:(nullable FDRouterHandle)handle;
- (nullable Class)navToName:(NSString*)name;

@end

NS_ASSUME_NONNULL_END

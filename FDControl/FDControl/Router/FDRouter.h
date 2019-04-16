//
//  FDRouter.h
//  FDControl
//
//  Created by zhangyu528 on 2019/4/15.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FDRouterRegParam.h"

NS_ASSUME_NONNULL_BEGIN

@interface FDRouter : NSObject

+ (instancetype)new UNAVAILABLE_ATTRIBUTE;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;

+ (instancetype)shared;

- (instancetype)installRoutes:(NSSet<FDRouterRegParam*>*)routes;

- (Class)navTo:(NSString*)path;
- (Class)navToUrl:(NSURL*)url;
@end

NS_ASSUME_NONNULL_END

//
//  FDRouter.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/15.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDRouter.h"

@interface FDRouter ()
@property(strong, nonatomic)NSSet<FDRouterRegParam*>* routes;
@end

@implementation FDRouter

+ (instancetype)shared:(NSArray<FDRouterRegParam*>*)routes {
    static FDRouter* _instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc]initWithRoutes:routes];
    });
    return _instance;
}

- (instancetype)initWithRoutes:(NSSet<FDRouterRegParam*>*)routes {
    if (routes == nil || routes.count == 0) {
        return nil;
    }
    
    if (self = [super init]) {
        _routes = routes;
    }
    return self;
}

- (void)push:(NSString*)path {
    
}
@end

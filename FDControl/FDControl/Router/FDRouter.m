//
//  FDRouter.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/15.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDRouter.h"

#import <UIKit/UIKit.h>

@interface FDRouter ()
@property(strong, nonatomic)NSSet<FDRouterRegParam*>* routes;
@property(strong, nonatomic)NSMutableDictionary* routeTable;
@end

@implementation FDRouter

+ (instancetype)shared {
    static FDRouter* _instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc]init];
    });
    return _instance;
}

- (instancetype)installRoutes:(NSSet<FDRouterRegParam*>*)routes {
    if (routes == nil || routes.count == 0) {
        return nil;
    }
    _routes = routes;
    _routeTable = [NSMutableDictionary new];
    NSArray* ary = [_routes allObjects];
    for (FDRouterRegParam* param in ary) {
        if ([param objectForKey:@"component"] && [param objectForKey:@"path"]) {
            [_routeTable setObject:[param objectForKey:@"component"] forKey:[param objectForKey:@"path"]];
        };
    }
    return self;
}

- (Class)navTo:(NSString*)path {
    Class cls = [self.routeTable objectForKey:path];
    return cls;
}
@end

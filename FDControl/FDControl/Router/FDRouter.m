//
//  FDRouter.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/15.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDRouter.h"

#import <UIKit/UIKit.h>
#import "FDControl.h"

@interface FDRouter ()
@property(strong, nonatomic)NSSet<FDRouterRegParam*>* routes;
@property(strong, nonatomic)NSMutableDictionary* routeTable;
@property(strong, nonatomic)NSString* scheme;
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
    _scheme = [NSBundle firstScheme]?[NSBundle firstScheme]:@"FDControlDemo";
    _scheme = [_scheme stringByAppendingString:@"://"];
    _routeTable = [NSMutableDictionary new];
    NSArray* ary = [_routes allObjects];
    for (FDRouterRegParam* param in ary) {
        Class component = [param objectForKey:@"component"];
        NSString* path = [param objectForKey:@"path"];
        if ( component && path ) {
            path = [path stringByTrimming:@"/"];
            NSString* uri = [_scheme stringByAppendingString:path];
            [_routeTable setObject:component forKey:uri];
        };
    }
    return self;
}

- (Class)navTo:(NSString*)path {
    path = [path stringByTrimming:@"/"];
    NSString* uri = [self.scheme stringByAppendingString:path];
    Class cls = [self.routeTable objectForKey:uri];
    return cls;
}

- (Class)navToUrl:(NSURL*)url {
    NSString* uri = [url absoluteString];
    Class cls = [self.routeTable objectForKey:uri];
    return cls;
}
@end

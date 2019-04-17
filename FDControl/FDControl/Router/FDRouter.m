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
@property(strong, nonatomic)NSMutableDictionary* nameTable;
@property(strong, nonatomic)NSString* scheme;
@end

@implementation FDRouter

//+ (instancetype)initialize {
//    if (self == [FDRouter class]) {
//        
//    }
//}

+ (instancetype)shared {
    static FDRouter* _instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc]init];
    });
    return _instance;
}

- (void)registerRoutes:(NSSet<FDRouterRegParam*>*)routes {
    if (routes == nil || routes.count == 0) {
        return;
    }

    _scheme = [NSBundle firstScheme]?[NSBundle firstScheme]:@"fd";
    _routes = routes;
    _routeTable = [NSMutableDictionary new];
    _nameTable = [NSMutableDictionary new];
    [self parseRouteRegParam];
}

- (void)parseRouteRegParam {
    NSArray* ary = [_routes allObjects];
    for (FDRouterRegParam* param in ary) {
        NSString* component = [param objectForKey:@"component"];
        NSString* path = [param objectForKey:@"path"];
        path = [path stringByTrimming:@"/"];
        NSString* uri = [_scheme stringByAppendingFormat:@"://%@", path];
        NSString* name = [param objectForKey:@"name"];
        
        NSMutableDictionary* subRoutes = self.routeTable;
        if ( component && uri && [uri isValidURL]) {
            for (NSString* pathComponent in uri.pathComponents) {
                if (![subRoutes objectForKey:pathComponent]) {
                    NSMutableDictionary* node = [NSMutableDictionary new];
                    if ([[path.pathComponents lastObject] isEqual:pathComponent]) {
                        if (name) {
                            [node setObject:name forKey:@"name"];
                            [_nameTable setObject:component forKey:name];
                        }
                        [node setObject:component forKey:@"component"];
                    }
                    [subRoutes setObject:node forKey:pathComponent];
                }
                subRoutes = [subRoutes objectForKey:pathComponent];
            }
        };
    }
}

- (Class)navTo:(NSString*)path {
    path = [path stringByTrimming:@"/"];
    if (![path isValidURL]) {
        return nil;
    };
    NSString* uri = [_scheme stringByAppendingFormat:@"://%@", path];
    NSDictionary* subRoutes = self.routeTable;
    for (NSString* pathComponent in uri.pathComponents) {
        subRoutes = [subRoutes objectForKey:pathComponent];
    }
    Class cls = NSClassFromString([subRoutes objectForKey:@"component"]);
    return cls;
}

- (Class)navToUrl:(NSURL*)url {
    if (!url) {
        return nil;
    }
    NSString* uri = [url absoluteString];
    NSDictionary* subRoutes = self.routeTable;
    for (NSString* pathComponent in uri.pathComponents) {
        subRoutes = [subRoutes objectForKey:pathComponent];
    }
    Class cls = NSClassFromString([subRoutes objectForKey:@"component"]);
    return cls;
}

- (nullable Class)navToName:(NSString*)name param:(NSDictionary*)param {
    if (!name) {
        return nil;
    }
    
    Class cls = NSClassFromString([self.nameTable objectForKey:name]);
    return cls;
}
@end

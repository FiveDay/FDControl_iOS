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
@property(strong, nonatomic)NSString* host;
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

- (instancetype)init {
    if (self = [super init]) {
        _host = @"localhost";
        _scheme = [NSBundle firstScheme]?[NSBundle firstScheme]:@"fd";
    }
    return self;
}

- (void)registerRoutes:(NSSet<FDRouterRegParam*>*)routes {
    if (routes == nil || routes.count == 0) {
        return;
    }
    _routes = routes;
    _routeTable = [NSMutableDictionary new];
    _nameTable = [NSMutableDictionary new];
    
    [self parseRouteRegParam];
}

- (NSString*)getAbsoluteUri:(NSString*)path {
    NSString* scheme = [self.scheme stringByAppendingString:@"://"];
    NSString* uri = [[scheme stringByAppendingString:self.host]stringByAppendingFormat:@"/%@", path];
    return uri;
}

- (void)parseRouteRegParam {
    NSArray* ary = [_routes allObjects];
    for (FDRouterRegParam* param in ary) {
        
        NSString* component = [param objectForKey:@"component"];
        NSString* path = [param objectForKey:@"path"];
        path = [path stringByTrimming:@"/"];
        NSString* name = [param objectForKey:@"name"];
        
        NSString* uri = [self getAbsoluteUri:path];
        NSURL* url = [NSURL URLWithString:uri];
        NSURLComponents* urlComponents = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:NO];
        
        if ( component && url ) {
            NSMutableDictionary* subRoutes = self.routeTable;
            for (NSString* pathComponent in urlComponents.path.pathComponents) {
                if ([subRoutes objectForKey:pathComponent]) {
                    subRoutes = [subRoutes objectForKey:pathComponent];
                }else {
                    NSMutableDictionary* node = [NSMutableDictionary new];
                    [subRoutes setObject:node forKey:pathComponent];
                    if ([pathComponent isEqual:[uri.pathComponents lastObject]]) {
                        if (name) {
                            [node setObject:name forKey:@"name"];
                            [_nameTable setObject:component forKey:name];
                        }
                        [node setObject:component forKey:@"component"];
                        
                    }
                    subRoutes = [subRoutes objectForKey:pathComponent];
                }
            }
        };
    }
}

//- (void)navTo:(NSString*)path handle:(FDRouterHandle)handle {
//    path = [path stringByTrimming:@"/"];
//    if (![path isValidURL]) {
//        return;
//    };
//    NSString* uri = [self getAbsoluteUri:path];
//    NSURL* url = [NSURL URLWithString:uri];
//    NSURLComponents* urlComponents = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:NO];
//    NSDictionary* subRoutes = self.routeTable;
//    for (NSString* pathComponent in urlComponents.path.pathComponents) {
//        subRoutes = [subRoutes objectForKey:pathComponent];
//    }
//    Class cls = NSClassFromString([subRoutes objectForKey:@"component"]);
//
//    NSMutableDictionary* params = [NSMutableDictionary new];
//    for (NSURLQueryItem* item in urlComponents.queryItems) {
//        [params setObject:item.value forKey:item.name];
//    }
//    handle(cls, [params copy]);
//}

//- (void)navToUrl:(NSURL*)url handle:(FDRouterHandle)handle {
//    if (!url) {
//        return;
//    }
//
//    NSURLComponents* urlComponents = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:NO];
//    NSDictionary* subRoutes = self.routeTable;
//    for (NSString* pathComponent in urlComponents.path.pathComponents) {
//        subRoutes = [subRoutes objectForKey:pathComponent];
//    }
//    Class cls = NSClassFromString([subRoutes objectForKey:@"component"]);
//    NSMutableDictionary* params = [NSMutableDictionary new];
//    for (NSURLQueryItem* item in urlComponents.queryItems) {
//        [params setObject:item.value forKey:item.name];
//    }
//    handle(cls, [params copy]);
//}

- (UIViewController*)navTo:(NSString*)path {
    path = [path stringByTrimming:@"/"];
    if (![path isValidURL]) {
        return nil;
    };
    NSString* uri = [self getAbsoluteUri:path];
    NSURL* url = [NSURL URLWithString:uri];
    NSURLComponents* urlComponents = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:NO];
    NSDictionary* subRoutes = self.routeTable;
    for (NSString* pathComponent in urlComponents.path.pathComponents) {
        subRoutes = [subRoutes objectForKey:pathComponent];
    }
    Class cls = NSClassFromString([subRoutes objectForKey:@"component"]);
    
    NSMutableDictionary* param = [NSMutableDictionary new];
    for (NSURLQueryItem* item in urlComponents.queryItems) {
        [param setObject:item.value forKey:item.name];
    }
    UIViewController* ctl = [cls viewControllerWithParam:param];
    return ctl;
}

- (UIViewController*)navToUrl:(NSURL*)url {
    if (!url) {
        return nil;
    }
    
    NSURLComponents* urlComponents = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:NO];
    NSDictionary* subRoutes = self.routeTable;
    for (NSString* pathComponent in urlComponents.path.pathComponents) {
        subRoutes = [subRoutes objectForKey:pathComponent];
    }
    Class cls = NSClassFromString([subRoutes objectForKey:@"component"]);
    NSMutableDictionary* param = [NSMutableDictionary new];
    for (NSURLQueryItem* item in urlComponents.queryItems) {
        [param setObject:item.value forKey:item.name];
    }
    UIViewController* ctl = [cls viewControllerWithParam:param];
    return ctl;
}

- (UIViewController*)navToName:(NSString*)name param:(NSDictionary*)param {
    if (!name) {
        return nil;
    }
    Class cls = NSClassFromString([self.nameTable objectForKey:name]);
    UIViewController* ctl = [cls viewControllerWithParam:param];
    return ctl;
}
@end

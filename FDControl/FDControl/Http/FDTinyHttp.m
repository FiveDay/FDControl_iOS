//
//  FDTinyHttp.m
//  FDControl
//
//  Created by zhangyu528 on 2019/9/20.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDTinyHttp.h"
#import "FDTinyRequestOperation.h"

@interface FDTinyHttp ()
@property(strong, nonatomic)NSURLSessionConfiguration* configuration;
@property(strong, nonatomic)NSURLSession* session;
@property(strong, nonatomic)NSOperationQueue* queue;
@end

@implementation FDTinyHttp

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    static FDTinyHttp* _instance;
    dispatch_once(&onceToken, ^{
         _instance = [FDTinyHttp new];
    });
    return _instance;
}

- (instancetype)init {
    if (self = [super init]) {
        _queue = [NSOperationQueue new];
        _queue.maxConcurrentOperationCount = 6;
    }
    return self;
}

- (void)setEnviorment:(NSString*)root {
}

- (void)startRequest:(id)request completion:(void(^)(id response, NSError* error))completion {
    NSURLRequest* req = [NSURLRequest new];//根据request生成req
    FDTinyRequestOperation* op = [[FDTinyRequestOperation alloc]initWithRequest:req session:self.session completion:completion];
    [self.queue addOperation:op];
}

- (NSURLSessionConfiguration*)configuration {
    if (_configuration) {
        return _configuration;
    }
    _configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    return _configuration;
}

- (NSURLSession*)session {
    if (_session) {
        return _session;
    }
    _session = [NSURLSession sessionWithConfiguration:self.configuration];
    return _session;
}
@end

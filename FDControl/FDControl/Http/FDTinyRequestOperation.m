//
//  FDTinyRequestOperation.m
//  FDControl
//
//  Created by zhangyu528 on 2019/9/20.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDTinyRequestOperation.h"

@interface FDTinyRequestOperation ()
@property(strong, nonatomic)NSURLRequest* request;
@property(strong, nonatomic)NSURLSession* session;
@property(strong, nonatomic)NSURLSessionDataTask* dataTask;
@property(weak, nonatomic)Completion completion;
@end

@implementation FDTinyRequestOperation

- (instancetype)initWithRequest:(NSURLRequest*)request
                        session:(NSURLSession*)session
                 completion:(Completion)completion {
    if (request == nil || session == nil) return nil;

    if (self = [super init]) {
        _request = request;
        _session = session;
        _completion = completion;
    }
    return self;
}

- (void)start {
    __weak __typeof(self) wself = self;
    self.dataTask = [self.session dataTaskWithRequest:self.request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        wself.completion(data, error);
    }];
    [self.dataTask resume];
}
@end

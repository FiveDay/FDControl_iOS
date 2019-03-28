//
//  FDWebImageDownloaderOperation.m
//  FDControl
//
//  Created by zhangyu528 on 2019/3/15.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDWebImageDownloaderOperation.h"

@interface FDWebImageDownloaderOperation ()
@property(strong, nonatomic)NSURLRequest* request;
@property(strong, nonatomic)NSURLSession* session;

@property(strong, nonatomic)NSURLSessionDataTask* dataTask;

@property (assign, nonatomic, getter=isExecuting) BOOL executing;
@property (assign, nonatomic, getter=isFinished) BOOL finished;

@property (strong, nonatomic)FDWebImageDownloaderOperationCompletedBlock completedBlock;
@end



@implementation FDWebImageDownloaderOperation

@synthesize executing = _executing;
@synthesize finished = _finished;

- (instancetype)initWithRequest:(NSURLRequest*)request
                        session:(NSURLSession*)session
                 completedBlock:(nullable FDWebImageDownloaderOperationCompletedBlock)completedBlock {
    if (self = [super init]) {
        NSParameterAssert(request);
        NSParameterAssert(session);
        
        _request = request;
        _session = session;
        _completedBlock = completedBlock;

    }
    return self;
}

- (void)dealloc {
    
}

- (void)start {
    if (self.isCancelled) {
        self.finished = YES;
        return;
    }
    __weak __typeof(self) wself = self;
    
    self.dataTask = [self.session dataTaskWithRequest:self.request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            wself.completedBlock(nil, error);
            return;
        }
        UIImage* image = [UIImage imageWithData:data];
        wself.completedBlock(image, error);
    }];
    [self.dataTask resume];
}

- (void)cancel {
    if (self.finished) {
        return;
    }
    [super cancel];
    
    [self.dataTask cancel];
    self.dataTask = nil;
    self.executing = NO;
    self.finished = YES;
}

- (BOOL)isAsynchronous {
    return YES;
}

- (void)setFinished:(BOOL)finished {
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}

- (void)setExecuting:(BOOL)executing {
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}
@end

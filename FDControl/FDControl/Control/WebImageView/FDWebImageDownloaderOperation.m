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

- (instancetype)init {
    @throw [NSException exceptionWithName:@"FDWebImageDonloaderOperation init error" reason:@"FDWebImageDownloaderOperation must be initialized with a request. Use the designated initializer to init." userInfo:nil];
    return [super init];
}

- (instancetype)initWithRequest:(NSURLRequest*)request
                        session:(NSURLSession*)session {
    if (self = [super init]) {
        NSParameterAssert(request);
        NSParameterAssert(session);
        
        _request = request;
        _session = session;
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
    self.dataTask = [self.session dataTaskWithRequest:self.request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            
        }else {
            UIImage* image = [UIImage imageWithData:data];
            self.completedBlock(image, error);
        }
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

- (void)addCompleteBlock:(nullable FDWebImageDownloaderOperationCompletedBlock) completedBlock {
    self.completedBlock = completedBlock;
}
@end

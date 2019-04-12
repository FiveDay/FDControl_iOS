//
//  FDWebImageDownloader.m
//  FDControl
//
//  Created by zhangyu528 on 2019/3/14.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDWebImageDownloader.h"
#import "FDWebImageDownloaderOperation.h"

@interface FDWebImageDownloader ()
@property(strong, nonatomic)NSMutableDictionary<NSString *, NSString *>* httpHeaders;
@property(assign, nonatomic)NSTimeInterval downloadTimeout;
@property(strong, nonatomic)NSURLSession* session;
@property(strong, nonatomic)NSOperationQueue* downloadQueue;
@end

@implementation FDWebImageDownloader

- (instancetype)init {
    if (self = [super init]) {
        _httpHeaders = [@{@"Accept": @"image/*;q=0.8"} mutableCopy];
        _downloadTimeout = 15.0;
        
        NSURLSessionConfiguration* configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        configuration.timeoutIntervalForRequest = _downloadTimeout;
        _session = [NSURLSession sessionWithConfiguration:configuration];
        
        _downloadQueue = [NSOperationQueue new];
        _downloadQueue.maxConcurrentOperationCount= 6;
    }
    return self;
}

- (void)downloadImageWithURL:(NSURL*)url
                   completed:(nullable FDWebImageDownloaderCompletedBlock)completedBlock; {
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc]initWithURL:url];
    request.allHTTPHeaderFields = self.httpHeaders;
    FDWebImageDownloaderOperation* op = [[FDWebImageDownloaderOperation alloc]initWithRequest:request session:self.session completedBlock:completedBlock];
    [self.downloadQueue addOperation:op];
}

@end

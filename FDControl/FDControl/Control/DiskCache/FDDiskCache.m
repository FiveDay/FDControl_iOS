//
//  FDDiskCache.m
//  FDControl
//
//  Created by zhangyu528 on 2019/3/21.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDDiskCache.h"

#import "FDControl.h"

static NSMapTable* _globalInstances;
static dispatch_semaphore_t _globalInstancesLock;

static void _FDDiskCacheInitGlobal() {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _globalInstancesLock = dispatch_semaphore_create(1);
        _globalInstances = [[NSMapTable alloc]initWithKeyOptions:NSPointerFunctionsStrongMemory valueOptions:NSPointerFunctionsWeakMemory capacity:0];
    });
}

static FDDiskCache* _FDDiskCacheGetGlobao(NSString* path) {
    if (path.length == 0) {
        return nil;
    }
    _FDDiskCacheInitGlobal();
    dispatch_semaphore_wait(_globalInstancesLock, DISPATCH_TIME_FOREVER);
    id cache = [_globalInstances objectForKey:path];
    dispatch_semaphore_signal(_globalInstancesLock);
    return cache;
}

static void _FDDiskCacheSetGlobal(FDDiskCache* cache, NSString* key) {
    if (key.length == 0) {
        return;
    }
    _FDDiskCacheInitGlobal();
    dispatch_semaphore_wait(_globalInstancesLock, DISPATCH_TIME_FOREVER);
    [_globalInstances setObject:cache forKey:key];
    dispatch_semaphore_signal(_globalInstancesLock);
}

@interface FDDiskCache ()
@property(strong, nonatomic, nonnull)NSString* key;
@property(strong, nonatomic, nonnull)NSString* diskRootPath;
@property(strong, nonatomic, nonnull)NSFileManager* fileManager;
@property(strong, nonatomic, nonnull)dispatch_queue_t ioQueue;
@end

@implementation FDDiskCache

- (nullable instancetype)initWithKey:(NSString*)key {
    NSParameterAssert(key);
    
    if (self = [super init]) {
        FDDiskCache* globalCache = _FDDiskCacheGetGlobao(key);
        if (globalCache) return globalCache;
        
        NSString* nameSpace = @"com.fiveday.FDDiskCache";
        NSString* cacheDirectory = [NSString fd_cacheDirectory];
        _diskRootPath = [cacheDirectory stringByAppendingPathComponent:nameSpace];
        _fileManager = [[NSFileManager alloc]init];
        [_fileManager createDirectoryAtPath:_diskRootPath withIntermediateDirectories:YES attributes:nil error:nil];
        
        _ioQueue = dispatch_queue_create("com.fiveday.FDDiskCache", DISPATCH_QUEUE_SERIAL);
        
        _FDDiskCacheSetGlobal(self, key);
    }
    return self;
}

- (void)storeData:(NSData*)data {
    NSParameterAssert(data);
    
    dispatch_async(self.ioQueue, ^{
        NSString* fileName = [self.key fd_toMD5String16];
        NSString* filePath = [self.diskRootPath stringByAppendingPathComponent:fileName];
        [self.fileManager createFileAtPath:filePath contents:data attributes:nil];
    });
}

- (void)queryData:(FDDiskCacheQueryCompletedBlock)completion {
    dispatch_async(self.ioQueue, ^{
        NSString* fileName = [self.key fd_toMD5String16];
        NSString* filePath = [self.diskRootPath stringByAppendingPathComponent:fileName];
        NSData* data = [NSData dataWithContentsOfFile:filePath];
        if (completion) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(data);
            });
        }
    });
}

- (void)removeData:(FDDiskCacheCompletedBlock)completion {
    dispatch_async(self.ioQueue, ^{
        NSString* fileName = [self.key fd_toMD5String16];
        NSString* filePath = [self.diskRootPath stringByAppendingPathComponent:fileName];
        NSError* error;
        [self.fileManager removeItemAtPath:filePath error:&error];
        if (completion) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(error);
            });
        }
    });
}
@end

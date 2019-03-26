//
//  FDDiskCache.h
//  FDControl
//
//  Created by zhangyu528 on 2019/3/21.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FDDiskCacheStoreCompletedBlock)(BOOL isSuccess);
typedef void(^FDDiskCacheQueryCompletedBlock)(NSData* _Nullable data);
typedef void(^FDDiskCacheRemoveCompletedBlock)(NSError* _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface FDDiskCache : NSObject

#pragma mark - Initializer

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

- (nullable instancetype)initWithKey:(NSString*)key;

- (void)storeData:(NSData*)data completion:(nullable FDDiskCacheStoreCompletedBlock)completion;
- (void)queryData:(nullable FDDiskCacheQueryCompletedBlock)completion;
- (void)removeData:(nullable FDDiskCacheRemoveCompletedBlock)completion;

@end

NS_ASSUME_NONNULL_END

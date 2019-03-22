//
//  FDDiskCache.h
//  FDControl
//
//  Created by zhangyu528 on 2019/3/21.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FDDiskCacheQueryCompletedBlock)(NSData* _Nullable data);
typedef void(^FDDiskCacheCompletedBlock)(NSError* _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface FDDiskCache : NSObject

#pragma mark - Initializer

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

- (nullable instancetype)initWithKey:(NSString*)key;

- (void)storeData:(NSData*)data;
- (void)queryData:(FDDiskCacheQueryCompletedBlock)completion;
- (void)removeData:(FDDiskCacheCompletedBlock)completion;

@end

NS_ASSUME_NONNULL_END

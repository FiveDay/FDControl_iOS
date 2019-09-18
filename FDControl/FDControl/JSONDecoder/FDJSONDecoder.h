//
//  FDJSONDecoder.h
//  FDControl
//
//  Created by zhangyu528 on 2019/5/29.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FDCoding.h"
#import "FDCoder.h"

NS_ASSUME_NONNULL_BEGIN

@interface FDJSONDecoder : NSObject

+ (nullable id)decode:(Class)Cls dictionary:(NSDictionary*)dictionary;

+ (nullable id)decode:(Class)cls data:(NSData*)data;

@end

NS_ASSUME_NONNULL_END

//
//  FDCoder.h
//  FDControl
//
//  Created by zhangyu528 on 2019/5/29.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FDCoding.h"

const static NSString* _Nullable standerDateFormatterString = @"YYYY-MM-dd'T'HH:mm:ssZ";

NS_ASSUME_NONNULL_BEGIN

@interface FDCoder : NSObject

- (nullable instancetype)initWithDictionary:(NSDictionary*)dictionary;

- (id)decode:(Class)Cls key:(NSString*)key;

@end

NS_ASSUME_NONNULL_END

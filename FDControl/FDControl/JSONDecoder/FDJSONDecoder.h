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

//json:对象支持的数据类型NSDictionary,NString,NSdata
+ (nullable id)decode:(Class)Cls JSON:(id)json;

@end

NS_ASSUME_NONNULL_END

//
//  FDCoder.h
//  FDControl
//
//  Created by zhangyu528 on 2019/5/29.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FDCoding.h"

NS_ASSUME_NONNULL_BEGIN

@interface FDCoder : NSObject

- (instancetype)initWithJsonDic:(NSDictionary*)dic;

- (id)decode:(Class)Cls key:(NSString*)key;

@end

NS_ASSUME_NONNULL_END

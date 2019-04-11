//
//  NSDictionary+FDJSONSerialization.h
//  FDControl
//
//  Created by zhangyu528 on 2019/4/10.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (FDJSONSerialization)

- (NSString*)fd_toJSONString;

@end

NS_ASSUME_NONNULL_END

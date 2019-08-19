//
//  NSDate+FDExchange.h
//  FDControl
//
//  Created by zhangyu528 on 2019/8/16.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (FDExchange)

+ (instancetype)dateString:(NSString*)str format:(NSString*)format;

- (NSString*)toStringByFormatString:(NSString*)format;

@end

NS_ASSUME_NONNULL_END

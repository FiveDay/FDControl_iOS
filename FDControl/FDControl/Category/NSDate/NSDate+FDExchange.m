//
//  NSDate+FDExchange.m
//  FDControl
//
//  Created by zhangyu528 on 2019/8/16.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "NSDate+FDExchange.h"

@implementation NSDate (FDExchange)

+ (instancetype)dateString:(NSString*)str format:(NSString*)format {
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = format;
    return [formatter dateFromString:str];
}

- (NSString*)toStringByFormatString:(NSString*)format {
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

@end

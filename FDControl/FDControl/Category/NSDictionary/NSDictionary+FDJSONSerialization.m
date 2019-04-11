//
//  NSDictionary+FDJSONSerialization.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/10.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "NSDictionary+FDJSONSerialization.h"

@implementation NSDictionary (FDJSONSerialization)

- (NSString*)fd_toJSONString {
    if (![NSJSONSerialization isValidJSONObject:self]) {
        return nil;
    }
    NSError* error;
    NSData* data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingSortedKeys error:&error];
    if (!data || error) {
        return nil;
    }
    
    NSString* jsonStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    return jsonStr;
}
@end

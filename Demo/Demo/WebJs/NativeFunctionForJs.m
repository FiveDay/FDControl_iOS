
//
//  NativeFunctionForJs.m
//  Demo
//
//  Created by zhangyu528 on 2019/4/10.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "NativeFunctionForJs.h"

@implementation NativeFunctionForJs

- (NSDictionary*)getTokenUserId:(id)data {
    NSString* token = @"fdfdfd";
    NSString* user_id = @"ffffs";
    NSDictionary* response = @{
                                @"token": token?token:@"",
                                @"user_id":user_id?user_id:@""
                               };
    return response;
}

@end

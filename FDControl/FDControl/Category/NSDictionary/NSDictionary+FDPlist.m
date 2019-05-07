//
//  NSDictionary+FDPlist.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/19.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "NSDictionary+FDPlist.h"

@implementation NSDictionary (FDPlist)

+ (instancetype)dictionaryWithPlistNamed:(NSString*)name {
    NSString* pathToPlist = [[NSBundle mainBundle]pathForResource:name ofType:@"plist"];
    return [[NSDictionary alloc]initWithContentsOfFile:pathToPlist];
}

@end

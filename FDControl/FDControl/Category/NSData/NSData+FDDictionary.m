//
//  NSData+FDDictionary.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/19.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "NSData+FDDictionary.h"

@implementation NSData (FDDictionary)

- (NSDictionary*)toDictionary {
    return (NSDictionary*) [NSKeyedUnarchiver unarchiveObjectWithData:self];
}

@end

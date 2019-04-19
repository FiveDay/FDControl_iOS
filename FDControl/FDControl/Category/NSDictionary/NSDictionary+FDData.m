//
//  NSDictionary+FDData.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/19.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "NSDictionary+FDData.h"

@implementation NSDictionary (FDData)

- (NSData*)toData {
    return [NSKeyedArchiver archivedDataWithRootObject:self];
}

@end

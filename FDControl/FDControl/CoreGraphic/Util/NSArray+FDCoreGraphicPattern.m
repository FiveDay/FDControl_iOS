//
//  NSArray+FDCoreGraphicPattern.m
//  KeyApp
//
//  Created by zhangyu528 on 2019/10/25.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "NSArray+FDCoreGraphicPattern.h"

@implementation NSArray (FDCoreGraphicPattern)

- (CGFloat*)toFloats {
    CGFloat* ret = malloc(self.count * sizeof(CGFloat));
    int index = 0;
    for (NSNumber* item in self) {
        CGFloat data = item.floatValue;
        ret[index] = data;
        index ++;
    }
    return ret;
}
@end

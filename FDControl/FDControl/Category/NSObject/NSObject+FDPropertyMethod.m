//
//  NSObject+FDPropertyMethod.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/9.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "NSObject+FDPropertyMethod.h"

#import <objc/runtime.h>

@implementation NSObject (FDPropertyMethod)

- (NSArray<NSString*>*)getMethodNameArray {
    NSMutableArray* result = [NSMutableArray new];
    unsigned int methodCount = 0;
    Method* methods = class_copyMethodList([self class], &methodCount);
    for (int i = 0; i < methodCount; i++) {
        Method method = methods[i];
        SEL sel = method_getName(method);
        const char* name = sel_getName(sel);
        [result addObject:[NSString stringWithUTF8String:name]];
    }
    
    free(methods);
    return [result copy];
}

- (NSArray<NSString*>*)getPropertyNameList
{
    NSMutableArray<NSString*>* returnPropertyList = [NSMutableArray new];

    Class targetClass = [self class];
    while (targetClass) {
        unsigned int outPropertyCount = 0;
        objc_property_t* propertiesList = class_copyPropertyList(targetClass, &outPropertyCount);
        for (int i=0; i<outPropertyCount; ++i) {
            objc_property_t property = propertiesList[i];
            [returnPropertyList addObject:[[NSString alloc]initWithUTF8String:property_getName(property)]];
        }
        targetClass = [targetClass superclass];
        free(propertiesList);
    }
    
    return [returnPropertyList copy];
}


@end

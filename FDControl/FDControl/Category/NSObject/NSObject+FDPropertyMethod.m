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
    return [result copy];
}

- (void)addProperty:(const void * _Nonnull) key value:(id _Nullable) value {
    id propertyValue = objc_getAssociatedObject(self, key);
    if (propertyValue == nil) {
        propertyValue = value;
        objc_setAssociatedObject(self, key, propertyValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (id _Nullable)getPropertyValue:(const void * _Nonnull)key {
    return objc_getAssociatedObject(self, key);
}
@end

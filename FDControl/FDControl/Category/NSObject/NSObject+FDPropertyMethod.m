//
//  NSObject+FDPropertyMethod.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/9.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "NSObject+FDPropertyMethod.h"

#import <objc/runtime.h>

@interface FDProperty ()
@property(nonatomic, copy, readwrite) NSString* fdPropertyName;
@property(nonatomic, copy, readwrite) NSString* fdPropertyDescription;
@end

@implementation FDProperty
@end

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

- (NSArray<FDProperty*>*)getPropertyArray
{
    NSMutableArray* propertyMutableArray = [NSMutableArray array];
    unsigned int outPropertyCount = 0;
    objc_property_t* propertiesList = class_copyPropertyList([self class], &outPropertyCount);
    
    for (int i=0; i<outPropertyCount; ++i) {
        FDProperty* fdPropertyObject = [FDProperty new];
        objc_property_t property = propertiesList[i];
        fdPropertyObject.fdPropertyName = [[NSString alloc]initWithUTF8String:property_getName(property)];
        
        //判断是否存在Set***接口。如果有，设置为description
        NSMutableString* selString = [[NSMutableString alloc]initWithString:@"set"];
        //fdPropertyObject.fdPropertyName);
        SEL targetSel = NSSelectorFromString(selString);
        if ([self respondsToSelector:targetSel]) {
            //包含这个selector
        }
        
        //缓存属性
        [propertyMutableArray addObject:fdPropertyObject];
    }
    
    return [propertyMutableArray copy];
}
@end

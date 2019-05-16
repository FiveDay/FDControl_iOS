//
//  NSObject+FDPropertyMethod.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/9.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "NSObject+FDPropertyMethod.h"

#import <objc/runtime.h>
//FDProperty
@interface FDProperty ()
@property(nonatomic, copy, readwrite) NSString* fdPropertyName;
@property(nonatomic, copy, readwrite) NSString* fdPropertyDescription;
@end

@implementation FDProperty
@end

//FDSinglePropertiesItem
@interface FDSinglePropertiesItem ()
@property(nonatomic, copy, readwrite) NSString* fdClassName;
@property(nonatomic, strong, readwrite) NSArray<FDProperty*>* fdPropertyArray;
@end

@implementation FDSinglePropertiesItem
- (instancetype)init
{
    if (self = [super init]) {
        _fdPropertyArray = [NSArray new];
    }
    
    return self;
}
@end


//
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

- (NSMutableArray<FDSinglePropertiesItem*>*)getAllPropertiesList
{
    NSMutableArray<FDSinglePropertiesItem*>* returnPropertyList = [NSMutableArray new];

    Class targetClass = [self class];
    while (targetClass) {
        NSMutableArray* propertyMutableArray = [NSMutableArray array];
        unsigned int outPropertyCount = 0;
        objc_property_t* propertiesList = class_copyPropertyList(targetClass, &outPropertyCount);
        
        for (int i=0; i<outPropertyCount; ++i) {
            FDProperty* fdPropertyObject = [FDProperty new];
            objc_property_t property = propertiesList[i];
            fdPropertyObject.fdPropertyName = [[NSString alloc]initWithUTF8String:property_getName(property)];
            
            //缓存属性
            [propertyMutableArray addObject:fdPropertyObject];
        }
        
        FDSinglePropertiesItem* propertyItem = [FDSinglePropertiesItem new];
        propertyItem.fdPropertyArray = propertyMutableArray;
        propertyItem.fdClassName = NSStringFromClass(targetClass);
        
        [returnPropertyList addObject:propertyItem];
        
        targetClass = [targetClass superclass];
    }
    
    return [returnPropertyList copy];
}
@end

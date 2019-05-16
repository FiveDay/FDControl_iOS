//
//  NSObject+FDPropertyMethod.h
//  FDControl
//
//  Created by zhangyu528 on 2019/4/9.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*
 * 属性类标记
 */
@interface FDProperty : NSObject
@property(nonatomic, copy, readonly) NSString* fdPropertyName;
@property(nonatomic, copy, readonly) NSString* fdPropertyDescription;
@end

/*
 * 单独的<类-属性数组>的组合
 */
@interface FDSinglePropertiesItem : NSObject
@property(nonatomic, copy, readonly) NSString* fdClassName;
@property(nonatomic, strong, readonly) NSArray<FDProperty*>* fdPropertyArray;
@end

/*
 * 类的所有属性数组，包括父类
 */
@interface FDClassProperties : NSObject
@property(nonatomic,strong, readonly) NSMutableArray<FDSinglePropertiesItem*>* fdPropertyArray;

//格式化所有属性的结构，把对象转成字典或数组。
- (NSArray*)formatALLProperties;
@end


@interface NSObject (FDPropertyMethod)

- (NSArray<NSString*>*)getMethodNameArray;

/*
 * 获取类的所有属性的对象
 */
- (FDClassProperties*)getAllPropertiesList;
@end

NS_ASSUME_NONNULL_END

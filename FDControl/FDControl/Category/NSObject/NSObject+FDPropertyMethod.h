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



@interface NSObject (FDPropertyMethod)

- (NSArray<NSString*>*)getMethodNameArray;

/*
 * 获取类的所有属性
 */
- (NSMutableArray<FDSinglePropertiesItem*>*)getAllPropertiesList;
@end

NS_ASSUME_NONNULL_END

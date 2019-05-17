//
//  NSObject+FDClassInformation.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/16.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "NSObject+FDClassInformation.h"
#import "NSObject+FDPropertyMethod.h"

@implementation NSObject (FDClassInformation)

+ (void)printPropertyInformation {

    NSArray<NSString*>* list = [self getPropertyNameArray];
    if (list.count > 0) {
        NSLog(@"  Property:");
    }
    [list enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"    %@", obj);
    }];
}

+ (void)printMethodInformation {
    NSArray<NSString*>* list = [self getMethodNameArray];
    if (list.count > 0) {
        NSLog(@"  Method:");
    }
    [list enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"    %@", obj);
    }];
}

+ (void)printInformation {
    NSLog(@"%@ Information:", NSStringFromClass(self));
    [self printMethodInformation];
    [self printPropertyInformation];
    [[self superclass] printInformation];
}
@end

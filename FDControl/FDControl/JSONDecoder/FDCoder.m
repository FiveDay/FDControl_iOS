//
//  FDCoder.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/29.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDCoder.h"

@interface FDCoder ()
@property(strong, nonatomic)NSDictionary* jsonDic;
@end

@implementation FDCoder

- (instancetype)initWithJsonDic:(NSDictionary*)dic {
    if (self = [super init]) {
        self.jsonDic = dic;
    }
    return self;
}

- (id)decode:(Class)Cls key:(NSString*)key {
    if ([[NSString new] isKindOfClass:Cls]
        || [[NSNumber new] isKindOfClass:Cls]) {
        return [self.jsonDic objectForKey:key];
    } else {
        id jsonObj = [self.jsonDic objectForKey:key];
        if ([jsonObj isKindOfClass:[NSDictionary class]]) {
            FDCoder* coder = [[FDCoder alloc]initWithJsonDic:jsonObj];
            id obj = [[Cls alloc]initWithFDCoder:coder];
            return obj;
        } else if ([jsonObj isKindOfClass:[NSArray class]]) {
            NSMutableArray* objs = [NSMutableArray new];
            for (id obj in jsonObj) {
                FDCoder* coder = [[FDCoder alloc]initWithJsonDic:obj];
                id obj = [[Cls alloc]initWithFDCoder:coder];
                [objs addObject:obj];
            }
            
            return objs;
        }
    }
    return nil;
}
@end

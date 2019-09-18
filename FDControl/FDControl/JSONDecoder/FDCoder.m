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

- (instancetype)initWithDictionary:(NSDictionary*)dictionary {
    if (self = [super init]) {
        self.jsonDic = dictionary;
    }
    return self;
}

- (id)decode:(Class)Cls key:(NSString*)key {
    if ([NSStringFromClass(Cls) isEqualToString:@"NSString"]
        || [NSStringFromClass(Cls) isEqualToString:@"NSNumber"]) {
        return [self.jsonDic objectForKey:key];
    } else {
        id jsonObj = [self.jsonDic objectForKey:key];
        if ([jsonObj isKindOfClass:[NSDictionary class]]) {//NSDictionary
            FDCoder* coder = [[FDCoder alloc]initWithDictionary:jsonObj];
            id obj = [[Cls alloc]initWithFDCoder:coder];
            return obj;
        } else if ([jsonObj isKindOfClass:[NSArray class]]) {//NSArray
            NSMutableArray* objs = [NSMutableArray new];
            for (id item in jsonObj) {
                FDCoder* coder = [[FDCoder alloc]initWithDictionary:item];
                id obj = [[Cls alloc]initWithFDCoder:coder];
                [objs addObject:obj];
            }
            return objs;
        }
    }
    return nil;
}
@end

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

- (nullable instancetype)initWithDictionary:(NSDictionary*)dictionary {
    if (!dictionary || dictionary == (id)kCFNull) return nil;
    if (![dictionary isKindOfClass:[NSDictionary class]]) return nil;

    if (self = [super init]) {
        self.jsonDic = dictionary;
    }
    return self;
}

- (id)decode:(Class)Cls key:(NSString*)key {
    if (key == nil || key == (id)kCFNull || Cls == (id)kCFNull) return nil;
    
    if ([NSStringFromClass(Cls) isEqualToString:@"NSString"]) {
        id value = [self.jsonDic objectForKey:key];
        NSString* str = FDReturnNSStringFromId(value);
        return str;
    } else if ([NSStringFromClass(Cls) isEqualToString:@"NSNumber"]) {
        id value = [self.jsonDic objectForKey:key];
        NSNumber* num = FDReturnNSNumberFromId(value);
        return num;
    } else if ([NSStringFromClass(Cls)isEqualToString:@"NSDate"]) {
        id value = [self.jsonDic objectForKey:key];
        NSDate* date = FDReturnNSDateFromId(value);
        return date;
    } else if ([NSStringFromClass(Cls) isEqualToString:@"NSValue"]) {
        
    } else if ([NSStringFromClass(Cls) isEqualToString:@"NSData"]) {
        id value = [self.jsonDic objectForKey:key];
        if (![value isKindOfClass:[NSData class]]) return nil;
        return value;
    } else {//自定义类型
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

static NSDate* FDReturnNSDateFromId(id value) {
    if (!value || value == (id)kCFNull) return nil;//NSNull->nil
    if ([value isKindOfClass:[NSDate class]]) return value;//NSDate->NSDate
    
    if ([value isKindOfClass:[NSString class]]) {
        
    }
    return nil;
}

static NSString* FDReturnNSStringFromId(id value) {
    if (!value || value == (id)kCFNull) return nil;//NSNull->nil
    static NSDictionary *table;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        table = @{
                  @"NIL" :    (id)kCFNull,
                  @"Nil" :    (id)kCFNull,
                  @"nil" :    (id)kCFNull,
                  @"NULL" :   (id)kCFNull,
                  @"Null" :   (id)kCFNull,
                  @"null" :   (id)kCFNull,
                  @"(NULL)" : (id)kCFNull,
                  @"(Null)" : (id)kCFNull,
                  @"(null)" : (id)kCFNull,
                  @"<NULL>" : (id)kCFNull,
                  @"<Null>" : (id)kCFNull,
                  @"<null>" : (id)kCFNull};
    });
    NSString* str = table[value];//特殊字符串->nil
    if (str == (id)kCFNull) return nil;
    if ([value isKindOfClass:[NSString class]]) return value;//NSString->NString
    if ([value isKindOfClass:[NSNumber class]]) return ((NSNumber*)value).stringValue;//NSNumber->NString
    if ([value isKindOfClass:[NSDate class]]) {//NSDate->NString  格式化为 ISO8601:"YYYY-MM-dd'T'HH:mm:ssZ"
        NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
        formatter.dateFormat = @"YYYY-MM-dd'T'HH:mm:ssZ";
        str = [formatter stringFromDate:value];
        return str;
    }
    return nil;
}

static NSNumber* FDReturnNSNumberFromId(id value) {
    if (!value || value == (id)kCFNull) return nil;////NSNull->nil
    if ([value isKindOfClass:[NSNumber class]]) return value;//NSNumber->NSNumber
    
    static NSDictionary *table;
    static NSCharacterSet *dot;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dot = [NSCharacterSet characterSetWithRange:NSMakeRange('.', 1)];
        table = @{@"TRUE" :   @(YES),
                @"True" :   @(YES),
                @"true" :   @(YES),
                @"FALSE" :  @(NO),
                @"False" :  @(NO),
                @"false" :  @(NO),
                @"YES" :    @(YES),
                @"Yes" :    @(YES),
                @"yes" :    @(YES),
                @"NO" :     @(NO),
                @"No" :     @(NO),
                @"no" :     @(NO),
                @"NIL" :    (id)kCFNull,
                @"Nil" :    (id)kCFNull,
                @"nil" :    (id)kCFNull,
                @"NULL" :   (id)kCFNull,
                @"Null" :   (id)kCFNull,
                @"null" :   (id)kCFNull,
                @"(NULL)" : (id)kCFNull,
                @"(Null)" : (id)kCFNull,
                @"(null)" : (id)kCFNull,
                @"<NULL>" : (id)kCFNull,
                @"<Null>" : (id)kCFNull,
                @"<null>" : (id)kCFNull};
    });
    if ([value isKindOfClass:[NSString class]]) {//NSString->NSNumber
        NSNumber* num = table[value];//特殊字符串->NSNumber,nil
        if (num != nil) {
            if (num == (id)kCFNull) return nil;
            return num;
        }
        if ([(NSString *)value rangeOfCharacterFromSet:dot].location != NSNotFound) {//@"浮点数"->@(浮点数)
            const char *cstring = ((NSString *)value).UTF8String;
            if (!cstring) return nil;
            double num = atof(cstring);
            if (isnan(num) || isinf(num)) return nil;
            return @(num);
        } else {//@"整数"->@(整数)
            const char *cstring = ((NSString *)value).UTF8String;
            if (!cstring) return nil;
            return @(atoll(cstring));
        }
    }
    return nil;
}
@end

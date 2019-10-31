//
//  FDJSONDecoder.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/29.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDJSONDecoder.h"
#import "FDCoding.h"
#import "FDCoder.h"

@implementation FDJSONDecoder

+ (nullable id)decode:(Class)Cls JSON:(id)json {
    if (!json || json == (id)kCFNull) return nil;
    if (Cls == Nil) return nil;
    if (![Cls conformsToProtocol:@protocol(FDCoding)]) return nil;
    
    NSDictionary* dic = nil;
    NSData* jsonData = nil;
    
    if ([json isKindOfClass:[NSDictionary class]]) {
        dic = json;
    } else if ([json isKindOfClass:[NSString class]]) {
        jsonData = [(NSString*)json dataUsingEncoding:NSUTF8StringEncoding];//字符串转data（根据编码方式)
    } else if ([json isKindOfClass:[NSData class]]) {
        jsonData = json;
    }
    
    if (jsonData) {
        dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:NULL];
        if (![dic isKindOfClass:[NSDictionary class]]) dic = nil;
    }
    
    FDCoder* coder = [[FDCoder alloc]initWithDictionary:dic];
    id obj = [[Cls alloc]initWithFDCoder:coder];
    return obj;
}
@end

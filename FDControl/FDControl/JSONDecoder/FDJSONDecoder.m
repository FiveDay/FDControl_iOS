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

- (nullable id)decode:(Class)Cls data:(NSData*)data {
    if (!data || !Cls) {
        return nil;
    }
    NSError* error;
    id dic = [NSJSONSerialization JSONObjectWithData:data options:(0) error:&error];
    if (error) {
        return nil;
    }
    
    if ([Cls conformsToProtocol:@protocol(FDCoding)]) {
        FDCoder* coder = [[FDCoder alloc]initWithJsonDic:dic];
        id obj = [[Cls alloc]initWithFDCoder:coder];
        return obj;
    } else {
        return nil;
    }
}
@end

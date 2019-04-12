//
//  NSString+FDMD5.m
//  FDControl
//
//  Created by zhangyu528 on 2019/3/21.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "NSString+FDMD5.h"

#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (FDMD5)

- (nonnull NSString*)fd_toMD5String16 {
    NSData* data = [self dataUsingEncoding:NSUTF8StringEncoding];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(data.bytes, (CC_LONG)data.length, result);
    
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0],  result[1],  result[2],  result[3],
            result[4],  result[5],  result[6],  result[7],
            result[8],  result[9],  result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
@end

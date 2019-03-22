//
//  NSString+FDFileDirectory.m
//  FDControl
//
//  Created by zhangyu528 on 2019/3/21.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "NSString+FDFileDirectory.h"

@implementation NSString (FDFileDirectory)

+ (nonnull NSString*)fd_cacheDirectory {
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return [paths firstObject];
}
@end

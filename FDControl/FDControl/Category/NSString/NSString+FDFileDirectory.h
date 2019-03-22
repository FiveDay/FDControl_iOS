//
//  NSString+FDFileDirectory.h
//  FDControl
//
//  Created by zhangyu528 on 2019/3/21.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (FDFileDirectory)

+ (nonnull NSString*)fd_cacheDirectory;

@end

NS_ASSUME_NONNULL_END

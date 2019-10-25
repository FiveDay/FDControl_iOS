//
//  FDCoreGraphicColorSpace.h
//  KeyApp
//
//  Created by zhangyu528 on 2019/10/24.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

@interface FDCoreGraphicColorSpace : NSObject
@property(assign, nonatomic, readonly)CGColorSpaceRef colorSpaceRef;
@end

NS_ASSUME_NONNULL_END

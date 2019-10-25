//
//  FDCoreGraphicContext.h
//  KeyApp
//
//  Created by zhangyu528 on 2019/10/22.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

@interface FDCoreGraphicContext : NSObject
@property(assign, nonatomic, readonly)CGContextRef cgContext;

- (instancetype)initWithContextRef:(CGContextRef)contextRef;

@end

NS_ASSUME_NONNULL_END

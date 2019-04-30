//
//  FDRect360UpDownAni.h
//  FDControl
//
//  Created by zhangyu528 on 2019/4/29.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN



@interface FDRect360UpDownAni : CALayer

- (instancetype)initWithColor:(CGColorRef)color
                        width:(CGFloat)width
                          num:(NSUInteger)num;
@end

NS_ASSUME_NONNULL_END

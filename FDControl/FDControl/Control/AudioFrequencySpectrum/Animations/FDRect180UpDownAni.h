//
//  FDRect180UpDownAni.h
//  FDControl
//
//  Created by zhangyu528 on 2019/4/29.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface FDRect180UpDownAni : CAGradientLayer

- (instancetype)initWithWidth:(CGFloat)width
                       margin:(CGFloat)margin
                          num:(NSUInteger)num;

- (void)updateData:(NSMutableArray<NSNumber*>*)frequencyDatas;

@end

NS_ASSUME_NONNULL_END

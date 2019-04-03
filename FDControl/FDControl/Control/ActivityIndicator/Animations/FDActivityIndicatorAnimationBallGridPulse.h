//
//  FDActivityIndicatorAnimationBallGridPulse.h
//  FDControl
//
//  Created by zhangyu528 on 2019/3/28.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FDActivityIndicatorAnimationBallGridPulse : NSObject

- (instancetype)initWithBallRadius:(CGFloat)radius;

- (void)setupAnimation:(CALayer*) layer color:(UIColor*)color;

@end

NS_ASSUME_NONNULL_END

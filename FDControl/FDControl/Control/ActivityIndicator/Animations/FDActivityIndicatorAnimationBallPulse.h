//
//  FDActivityIndicatorAnimationBallPulse.h
//  FDControl
//
//  Created by zhangyu528 on 2019/1/8.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FDActivityIndicatorAnimationBallPulse : NSObject

- (instancetype)initWithBallRadius:(CGFloat)radius;

- (void)setupAnimation:(CALayer*) layer color:(UIColor*)color;

@end

//
//  FDActivityIndicatorView.h
//  FDControl
//
//  Created by zhangyu528 on 2019/1/9.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ballPulse,
    ballGridPulse,
    ballScale,
} FDActivityIndicatorType;

NS_ASSUME_NONNULL_BEGIN

@interface FDActivityIndicatorView : UIView

@property(strong, nonatomic)UIColor* tintColor;
@property(assign, nonatomic, readonly)BOOL isAnimating;

@property(assign, nonatomic, readonly)CGRect frame;
@property(assign, nonatomic, readonly)CGRect bounds;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithFrame:(CGRect)frame UNAVAILABLE_ATTRIBUTE;

- (instancetype)initWithOrign:(CGPoint)orign andBallScaleWithRadius:(CGFloat)radius;
- (instancetype)initWithOrign:(CGPoint)orign andBallPulseWithRadius:(CGFloat)radius;
- (instancetype)initWithOrign:(CGPoint)orign andBallGridPulseWithRadius:(CGFloat)radius;

- (void)startAnimating;
- (void)stopAnimating;

@end

NS_ASSUME_NONNULL_END

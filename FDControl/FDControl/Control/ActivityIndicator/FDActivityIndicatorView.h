//
//  FDActivityIndicatorView.h
//  FDControl
//
//  Created by zhangyu528 on 2019/1/9.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDAnimationView.h"


typedef enum : NSUInteger {
    ballPulse,
    ballGridPulse,
    ballClipRotate,
    squareSpin,
    ballScale = 12,
    triangleSkewSpin = 25,
} FDActivityIndicatorType;

NS_ASSUME_NONNULL_BEGIN

@interface FDActivityIndicatorView : FDAnimationView {
@private
    FDActivityIndicatorType _type;
}

@property(strong, nonatomic)UIColor* tintColor;
@property(assign, nonatomic)CGFloat radius;
@property(assign, nonatomic)CGFloat squareWidth;
@property(assign, nonatomic)CGSize triangleSize;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithFrame:(CGRect)frame UNAVAILABLE_ATTRIBUTE;

- (instancetype)initWithType:(FDActivityIndicatorType)type;

+ (instancetype)ballScaleWithRadius:(CGFloat)radius;
+ (instancetype)ballPulseWithRadius:(CGFloat)radius;
+ (instancetype)ballGridPulseWithRadius:(CGFloat)radius;
+ (instancetype)ballClipRotateRadius:(CGFloat)radius;

+ (instancetype)squareSpinWidth:(CGFloat)width;
+ (instancetype)triangleSkewSpinWithSize:(CGSize)size;
@end

NS_ASSUME_NONNULL_END

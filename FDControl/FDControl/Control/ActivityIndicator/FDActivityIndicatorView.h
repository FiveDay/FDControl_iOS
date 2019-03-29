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

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithFrame:(CGRect)frame UNAVAILABLE_ATTRIBUTE;

- (instancetype)initWithFrame:(CGRect)frame type:(FDActivityIndicatorType)type;

- (void)startAnimating;
- (void)stopAnimating;

@end

NS_ASSUME_NONNULL_END

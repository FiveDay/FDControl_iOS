//
//  FDDotView.h
//  FDControl
//
//  Created by zhangyu528 on 2019/5/14.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FDDotView : UIView

+ (instancetype)new UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithFrame:(CGRect)frame UNAVAILABLE_ATTRIBUTE;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;

- (instancetype)initWithRadius:(CGFloat)radius;

@property(assign, nonatomic, readonly)CGRect frame;
@end

NS_ASSUME_NONNULL_END

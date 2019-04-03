//
//  FDAnimationView.h
//  FDControl
//
//  Created by zhangyu528 on 2019/4/3.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>



NS_ASSUME_NONNULL_BEGIN

@interface FDAnimationView : UIView {
@protected
    id _animation;
}

@property(assign, nonatomic, readonly)BOOL isAnimating;

- (void)startAnimating;
- (void)stopAnimating;

- (void)setupAnimation;
@end

NS_ASSUME_NONNULL_END

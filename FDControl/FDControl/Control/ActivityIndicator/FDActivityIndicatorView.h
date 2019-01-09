//
//  FDActivityIndicatorView.h
//  FDControl
//
//  Created by zhangyu528 on 2019/1/9.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FDActivityIndicatorView : UIView

@property(assign, nonatomic, readonly)BOOL isAnimating;

- (void)startAnimating;
- (void)stopAnimating;

@end

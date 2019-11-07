//
//  UIView+Attribute.h
//  FDControl
//
//  Created by zhangyu528 on 2019/11/6.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Attribute)

//css
typedef UIView*(^FLColor)(UIColor*);
typedef UIView*(^FLCornerRadius)(CGFloat radius);
//css
@property(nonatomic, copy, readonly)FLColor backgroundColor;
@property(nonatomic, copy, readonly)FLCornerRadius cornerRadius;
@end

NS_ASSUME_NONNULL_END

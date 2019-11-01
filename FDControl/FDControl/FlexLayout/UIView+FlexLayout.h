//
//  UIView+FlexLayout.h
//  FDControl
//
//  Created by zhangyu528 on 2019/11/1.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

//render
typedef UIView*(^FLRender)(UIView* content);
//layout
typedef UIView*(^FLPaddingAttribute)(NSNumber* top, ...);
typedef UIView*(^FLMarginAttribute)(NSNumber* top, ...);

//css
typedef UIView*(^FLColorAttribute)(UIColor*);

NS_ASSUME_NONNULL_BEGIN

@interface UIView (FlexLayout)

//render
@property(nonatomic, copy, readonly)FLRender renderTo;
//Layout
@property(nonatomic, copy, readonly)FLPaddingAttribute padding;
@property(nonatomic, copy, readonly)FLMarginAttribute margin;

//css
@property(nonatomic, copy, readonly)FLColorAttribute backgroundColor;

@end

NS_ASSUME_NONNULL_END

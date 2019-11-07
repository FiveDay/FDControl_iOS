//
//  UIView+Layout.h
//  FDControl
//
//  Created by zhangyu528 on 2019/11/1.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

//render
typedef UIView*(^FLLayout)(UIView* content);

//layout
typedef UIView*(^FLSize)(CGFloat width, CGFloat height);

typedef UIView*(^FLPadding)(NSNumber* top, ...);
//typedef UIView*(^FLMargin)(NSNumber* top, ...);



NS_ASSUME_NONNULL_BEGIN

@interface UIView (FlexLayout)

//render
@property(nonatomic, copy, readonly)FLLayout layoutTo;

//Layout
@property(nonatomic, copy, readonly)FLSize size;

@property(nonatomic, copy, readonly)FLPadding padding;
//@property(nonatomic, copy, readonly)FLMargin margin;



@end

NS_ASSUME_NONNULL_END

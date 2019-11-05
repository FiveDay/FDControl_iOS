//
//  FLViewAttribute.h
//  FDControl
//
//  Created by zhangyu528 on 2019/11/1.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    FLFlexDirectionColumn = 0,
    FLFlexDirectionRow = 2,
} FLFlexDirection;

typedef enum : NSUInteger {
    FLAlignFlexStart = 1,
    FLAlignCenter = 2,
    FLAlignFlexEnd = 3,
} FLAlign;

NS_ASSUME_NONNULL_BEGIN

@interface FLViewAttribute : NSObject

- (instancetype)initWithView:(UIView*)view;

//flexDirection
@property(assign, nonatomic)FLFlexDirection flexDirection;
@property(assign, nonatomic)FLAlign align;
//padding
@property(strong, nonatomic)NSNumber* padding_top;
@property(strong, nonatomic)NSNumber* padding_right;
@property(strong, nonatomic)NSNumber* padding_bottom;
@property(strong, nonatomic)NSNumber* padding_left;

//margin
@property(strong, nonatomic)NSNumber* margin_top;
@property(strong, nonatomic)NSNumber* margin_right;
@property(strong, nonatomic)NSNumber* margin_bottom;
@property(strong, nonatomic)NSNumber* margin_left;
@end

NS_ASSUME_NONNULL_END

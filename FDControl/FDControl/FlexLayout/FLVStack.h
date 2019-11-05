//
//  FLVStack.h
//  FDControl
//
//  Created by zhangyu528 on 2019/10/31.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLPublicHeader.h"

@class FLVStack;


NS_ASSUME_NONNULL_BEGIN

@interface FLVStack : UIView

typedef FLVStack*(^FLAlignBlock)(FLAlign alignment);

@property(assign, nonatomic)FLAlignBlock alignment;

- (FLVStack*)contentView:(void(^)(UIView* content))block;

@end

NS_ASSUME_NONNULL_END

//
//  UIView+Attribute.m
//  FDControl
//
//  Created by zhangyu528 on 2019/11/6.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "UIView+Attribute.h"

@implementation UIView (Attribute)

- (FLColor)backgroundColor {
    return ^UIView*(UIColor* color) {
        [self setBackgroundColor:color];
        return self;
    };
}

- (FLCornerRadius)cornerRadius {
    return ^UIView*(CGFloat radius) {
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
        return self;
    };
}
@end

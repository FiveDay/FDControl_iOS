//
//  FDTabBar.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/9.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDTabBar.h"

@interface FDTabBar ()
@property(strong, nonatomic, nullable)UIButton* midButton;
@end

@implementation FDTabBar

- (UIButton*)midButton {
    if (_midButton == nil) {
        _midButton = [UIButton new];
        [self addSubview:_midButton];
    }
    return _midButton;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.items.count ==2 || self.items.count == 4) {
        CGFloat tabBarW = self.bounds.size.width;
        
        CGFloat btnW = tabBarW / (self.items.count + 1);
        CGFloat btnH = 0;
        CGFloat btnX = 0;
        CGFloat btnY = 0;
        
        NSInteger index = 0;
        for (UIView* sub in self.subviews) {
            if ([sub isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                if (self.items.count == 2
                    && index == 1) {
                    index = 2;
                }
                if (self.items.count == 4
                    && index == 2) {
                    index = 3;
                }
                btnH = sub.bounds.size.height;
                btnX = index * btnW;
                btnY = sub.frame.origin.y;
                sub.frame = CGRectMake(btnX, sub.frame.origin.y, btnW, sub.bounds.size.height);
                index ++;
            }
        }
        self.midButton.center = CGPointMake(tabBarW / 2, 0);
        self.midButton.frame = CGRectMake(self.midButton.frame.origin.x, btnY, btnW, btnH);
    }
}
@end

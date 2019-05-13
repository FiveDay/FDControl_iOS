//
//  FDTabBar.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/9.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDTabBar.h"
#import <objc/runtime.h>
#import "UITabBarItem+FDTabBar.h"

static char kAssociatedKeyFrameAnimationObjectKey;

@interface FDTabBar ()

@end

@implementation FDTabBar

- (void)setPlusButton:(UIButton *)plusButton {
    if (_plusButton == plusButton) {
        return;
    }
    [_plusButton removeFromSuperview];
    _plusButton = plusButton;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.items.count == 2 || self.items.count == 4) {
        CGFloat tabBarW = self.bounds.size.width;
        
        CGFloat btnW = tabBarW / (self.items.count + 1);
        CGFloat btnH = 0;
        CGFloat btnX = 0;
        CGFloat btnY = 0;
        
        NSInteger index = 0;
        for (UIView* sub in self.subviews) {
            if ([sub isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                //setup animations
                CAKeyframeAnimation* animation = self.items[index].animation;
                [self setupAnimation:animation tabBarButton:((UIControl*)sub)];
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
        self.plusButton.center = CGPointMake(tabBarW / 2, 0);
        self.plusButton.frame = CGRectMake(self.plusButton.frame.origin.x, btnY, btnW, btnH);
        self.plusButton.imageView.contentMode = UIViewContentModeBottom;
        [self addSubview:self.plusButton];
    }
}

- (void)setupAnimation:(CAKeyframeAnimation*)animation tabBarButton:(UIControl*)tabBarButton {
    [tabBarButton addTarget:self action:@selector(onTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    
    for (UIView* imageView in tabBarButton.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            id propertyValue = objc_getAssociatedObject(imageView, &kAssociatedKeyFrameAnimationObjectKey);
            if (propertyValue == nil) {
                propertyValue = animation;
                objc_setAssociatedObject(imageView, &kAssociatedKeyFrameAnimationObjectKey, propertyValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
        }
    }
}

- (void)onTouchUpInside:(UIControl*)tabBarButton {
    for (UIView* imageView in tabBarButton.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            CAKeyframeAnimation* animation = objc_getAssociatedObject(imageView, &kAssociatedKeyFrameAnimationObjectKey);
            [imageView.layer addAnimation:animation forKey:@"FD_KeyFrameAnimation"];
        }
    }
}
@end

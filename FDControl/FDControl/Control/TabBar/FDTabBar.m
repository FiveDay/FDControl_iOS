//
//  FDTabBar.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/9.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDTabBar.h"
#import "UITabBarItem+FDTabBar.h"
#import "FDControl.h"

static char kAssociatedKeyFrameAnimationObjectKey;
static char kAssociatedKeyBgImageViewObjecKey;

@interface FDTabBar ()
@end

@implementation FDTabBar

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
                
                
                sub.tag = index;
                btnH = sub.bounds.size.height;
                UIImageView* bgImageView = [sub getPropertyValue:&kAssociatedKeyBgImageViewObjecKey];
                if (bgImageView == nil) {
                    UIImageView* bgImageView = [[UIImageView alloc]init];
                    [sub addSubview:bgImageView];
                    [sub addProperty:&kAssociatedKeyBgImageViewObjecKey value:bgImageView];
                }
                bgImageView.frame = CGRectMake(0, 0, btnW, btnH);
                NSInteger selectedIndex = [self.items indexOfObject:self.selectedItem];
                if (sub.tag == selectedIndex) {
                    bgImageView.image = [UIImage imageWithColor:self.items[index].selectedBgColor andSize:bgImageView.frame.size];
                }

                //setup animations
                CAKeyframeAnimation* animation = self.items[index].animation;
                [self setupAnimation:animation tabBarButton:((UIControl*)sub)];
                sub.tag = index;
                
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
                sub.frame = CGRectMake(btnX, sub.frame.origin.y, btnW, btnH);
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
            [imageView addProperty:&kAssociatedKeyFrameAnimationObjectKey value:animation];
        }
    }
}

- (void)onTouchUpInside:(UIControl*)tabBarButton {
    
    //background image
    NSInteger index = [self.items indexOfObject:self.selectedItem];
    for (UIView* sub in self.subviews) {
        if ([sub isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            UIImageView* bgImageView;
            if (sub.tag == index) {
                bgImageView = [sub getPropertyValue:&kAssociatedKeyBgImageViewObjecKey];
                if (bgImageView == nil) {
                    bgImageView = [[UIImageView alloc]init];
                    [sub addSubview:bgImageView];
                    [sub addProperty:&kAssociatedKeyBgImageViewObjecKey value:bgImageView];
                }
                bgImageView.image = [UIImage imageWithColor:self.items[index].selectedBgColor andSize:bgImageView.frame.size];
            }else {
                bgImageView = [sub getPropertyValue:&kAssociatedKeyBgImageViewObjecKey];
                bgImageView.image = nil;
            }
        }
    }
    
    //add animation
    for (UIView* imageView in tabBarButton.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            CAKeyframeAnimation* animation = [imageView getPropertyValue:&kAssociatedKeyFrameAnimationObjectKey];
            [imageView.layer addAnimation:animation forKey:@"FD_KeyFrameAnimation"];
        }
    }
}
@end

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
        
        NSInteger itemIndex = 0;
        NSInteger plusButtonOffsetIndex = 0;
        for (UIView* sub in self.subviews) {
            if ([sub isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                sub.tag = itemIndex;
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
                    bgImageView.image = [UIImage imageWithColor:self.items[itemIndex].selectedBgColor andSize:bgImageView.frame.size];
                }

                //setup animations
                [self setupAnimation:itemIndex tabBarButton:((UIControl*)sub)];
                
                if (self.items.count == 2
                    && itemIndex == 1) {
                    plusButtonOffsetIndex = 2;
                }
                if (self.items.count == 4
                    && itemIndex == 2) {
                    plusButtonOffsetIndex = 3;
                }
                btnH = sub.bounds.size.height;
                btnX = plusButtonOffsetIndex * btnW;
                btnY = sub.frame.origin.y;
                sub.frame = CGRectMake(btnX, sub.frame.origin.y, btnW, btnH);
                itemIndex ++;
                plusButtonOffsetIndex ++;
            }
        }
        self.plusButton.center = CGPointMake(tabBarW / 2, 0);
        self.plusButton.frame = CGRectMake(self.plusButton.frame.origin.x, btnY, btnW, btnH);
        self.plusButton.imageView.contentMode = UIViewContentModeBottom;
        [self addSubview:self.plusButton];
    }
}

- (void)setupAnimation:(NSInteger)itemIdex tabBarButton:(UIControl*)tabBarButton {
    [tabBarButton addTarget:self action:@selector(onTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    CAAnimation* animation = self.items[itemIdex].animation;
    NSArray<UIImage*>* animationImages = self.items[itemIdex].animationImages;
    for (UIView* imageView in tabBarButton.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            [imageView addProperty:&kAssociatedKeyFrameAnimationObjectKey value:animation];
            [((UIImageView*)imageView) setAnimationImages:animationImages];
            [((UIImageView*)imageView) setAnimationRepeatCount:1];
            [((UIImageView*)imageView) setAnimationDuration:3.0f];
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
            [((UIImageView*)imageView) startAnimating];
        }
    }
}
@end

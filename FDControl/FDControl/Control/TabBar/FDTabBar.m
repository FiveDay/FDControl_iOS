//
//  FDTabBar.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/9.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDTabBar.h"
#import "UITabBarItem+FDTabBar.h"
#import "UITabBar+FDPrivateObject.h"
#import "NSObject+FDPropertyMethod.h"
#import "NSObject+FDRuntime.h"
#import "UIView+FDLayout.h"
#import "UIImage+FDColor.h"
#import "FDDotView.h"
#import "Lottie.h"

static char kAssociatedKeyAnimationObjectKey;
static char kAssociatedKeyBgImageViewObjecKey;
static char kAssociatedKeyDotViewObjectKey;
static char kAssociatedKeyLottieAnimationViewObjectKey;

@interface FDTabBar ()
@end

@implementation FDTabBar

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self layoutTabBarButton];
    [self setupBackgroundImageView];
    [self layoutPlusButton];
    [self setupCustomFunction];
}

- (void)layoutTabBarButton {
    if (self.plusButton
        &&(self.items.count == 2 || self.items.count == 4)) {
        __block NSInteger itemIndex = 0;
        __block NSInteger plusButtonOffsetIndex = 0;
        
        [self enumerateTabBarButtonUsingBlock:^(UIView * _Nonnull btn) {
            CGFloat tabBarW = self.bounds.size.width;
            
            CGFloat btnW = tabBarW / (self.items.count + 1);
            CGFloat btnH = 0;
            CGFloat btnX = 0;
            CGFloat btnY = 0;
            
            btnH = btn.bounds.size.height;
            
            if (self.items.count == 2
                && itemIndex == 1) {
                plusButtonOffsetIndex = 2;
            }
            if (self.items.count == 4
                && itemIndex == 2) {
                plusButtonOffsetIndex = 3;
            }
            btnH = btn.bounds.size.height;
            btnX = plusButtonOffsetIndex * btnW;
            btnY = btn.frame.origin.y;
            btn.frame = CGRectMake(btnX, btn.frame.origin.y, btnW, btnH);
            itemIndex ++;
            plusButtonOffsetIndex ++;
        }];
    }
}

- (void)layoutPlusButton {
    if (self.items.count == 2 || self.items.count == 4) {
        self.plusButton.center = CGPointMake(self.bounds.size.width / 2, 0);
        self.plusButton.frame = CGRectMake(self.plusButton.frame.origin.x, 0, 0, 0);
        [self.plusButton sizeToFit];
        [self addSubview:self.plusButton];
    }
}

- (void)setupBackgroundImageView {
    __block NSInteger itemIndex = 0;
    [self enumerateTabBarButtonUsingBlock:^(UIView * _Nonnull btn) {
        UIImageView* bgImageView = [btn getPropertyValue:&kAssociatedKeyBgImageViewObjecKey];
        if (bgImageView == nil) {
            bgImageView = [UIImageView new];
            [btn addSubview:bgImageView];
            [btn addProperty:&kAssociatedKeyBgImageViewObjecKey value:bgImageView];
        }
        NSInteger selectedIndex = [self.items indexOfObject:self.selectedItem];
        if (btn.tag == selectedIndex) {
            bgImageView.image = [UIImage imageWithColor:self.items[itemIndex].selectedBgColor andSize:bgImageView.frame.size];
        }
        itemIndex ++;
        //layout
        bgImageView.frame = CGRectMake(0, 0, btn.width, btn.height);
    }];
}

- (void)setupCustomFunction {
    __block NSInteger itemIndex = 0;

    [self enumerateTabBarButtonUsingBlock:^(UIView * _Nonnull btn) {
        
        //touch event
        [((UIControl*)btn) addTarget:self action:@selector(onTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        
        UIView* imageView = [self queryUITabBarSwappableImageView:btn];

        if (self.items[itemIndex].lottieName) {//Lottie animation
            LOTAnimationView* animationView  = [btn getPropertyValue:&kAssociatedKeyLottieAnimationViewObjectKey];
            if (animationView == nil) {
                animationView = [LOTAnimationView animationNamed:self.items[itemIndex].lottieName];
                animationView.userInteractionEnabled = NO;
                animationView.frame = btn.bounds;
                [btn addSubview:animationView];
                [btn addProperty:&kAssociatedKeyLottieAnimationViewObjectKey value:animationView];
            }
        } else {

            //CAAnimation
            CAAnimation* animation = self.items[itemIndex].animation;
            [imageView addProperty:&kAssociatedKeyAnimationObjectKey value:animation];
            
            //UIImageView animation
            NSArray<UIImage*>* animationImages = self.items[itemIndex].animationImages;
            [((UIImageView*)imageView) setAnimationImages:animationImages];
            [((UIImageView*)imageView) setAnimationRepeatCount:1];
            [((UIImageView*)imageView) setAnimationDuration:3.0f];
        }

        //Dot
        if (self.items[itemIndex].isShowDot) {
            FDDotView* dot = [imageView getPropertyValue:&kAssociatedKeyDotViewObjectKey];
            if (dot == nil) {
                FDDotView* dot = [[FDDotView alloc]initWithRadius:2.5];
                dot.orgin = CGPointMake(imageView.size.width - 5, 0);
                dot.backgroundColor = self.items[itemIndex].dotColor;
                [imageView addSubview:dot];
                [imageView addProperty:&kAssociatedKeyDotViewObjectKey value:dot];
            }
        }
        itemIndex ++;
    }];
   
}

- (void)onTouchUpInside:(UIControl*)tabBarButton {
    //background image
    NSInteger index = [self.items indexOfObject:self.selectedItem];
    
    [self enumerateTabBarButtonUsingBlock:^(UIView * _Nonnull btn) {
        id value;
        NSError* error;
        NSNumber* result;
        if ([btn validateValue:&value forKey:@"_isSelected" error:&error]) {
            result = [btn valueForKey:@"_isSelected"];
        }
        UIImageView* bgImageView;
        if (result.boolValue) {
            bgImageView = [btn getPropertyValue:&kAssociatedKeyBgImageViewObjecKey];
            if (bgImageView == nil) {
                bgImageView = [[UIImageView alloc]init];
                [btn addSubview:bgImageView];
                [btn addProperty:&kAssociatedKeyBgImageViewObjecKey value:bgImageView];
            }
            bgImageView.image = [UIImage imageWithColor:self.items[index].selectedBgColor andSize:bgImageView.frame.size];
        }else {
            bgImageView = [btn getPropertyValue:&kAssociatedKeyBgImageViewObjecKey];
            bgImageView.image = nil;
            
            LOTAnimationView* animation = [btn getPropertyValue:&kAssociatedKeyLottieAnimationViewObjectKey];
            [animation stop];
        }
    }];
    
    if (self.items[index].lottieName) {//Lottie animation start
        LOTAnimationView* animation = [tabBarButton getPropertyValue:&kAssociatedKeyLottieAnimationViewObjectKey];
        [animation play];
    }else {
        UIImageView* imageView = [self queryUITabBarSwappableImageView:tabBarButton];
        //CAnimation start
        CAKeyframeAnimation* animation = [imageView getPropertyValue:&kAssociatedKeyAnimationObjectKey];
        [imageView.layer addAnimation:animation forKey:@"FD_KeyFrameAnimation"];
        
        //UIImageView animation start
        [((UIImageView*)imageView) startAnimating];
    }
}
@end

//
//  FDPopMenu.m
//  FDControl
//
//  Created by zhangyu528 on 2019/1/16.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDPopMenu.h"

static FDPopMenu* g_instance;

@interface FDPopMenu ()
@property(strong, nonatomic)NSMutableArray* menuItems;
@property(strong, nonatomic)UIView* popMenuView;
@end

@implementation FDPopMenu

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        g_instance = [[FDPopMenu alloc]init];
    });
    return g_instance;
}

- (instancetype)init {
    NSAssert(!g_instance, @"singleton object!");
    
    if (self = [super init]) {
        _menuItems = [NSMutableArray array];
    }
    return self;
}

+ (void)addPopMenuItem:(FDPopMenuItem *)item {
    NSParameterAssert(item);
    
    [[self shared]addPopMenuItem:item];
}

+ (void)showInView:(UIView *)view {
    [[self shared]showInView:view];
}

- (void)showInView:(UIView *)view {
    
}

- (void)addPopMenuItem:(FDPopMenuItem *)item {
    [_menuItems addObject:item];
}
@end

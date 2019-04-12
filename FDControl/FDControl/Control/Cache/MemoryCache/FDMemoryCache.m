//
//  FDMemoryCache.m
//  FDControl
//
//  Created by zhangyu528 on 2019/3/26.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDMemoryCache.h"

@implementation FDMemoryCache

- (instancetype)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeAllObjects) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
}
@end

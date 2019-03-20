//
//  FDPopMenuItem.m
//  FDControl
//
//  Created by zhangyu528 on 2019/1/16.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDPopMenuItem.h"

@interface FDPopMenuItem ()
@property(strong, nonatomic)NSString* title;
@property(strong, nonatomic)UIImage* icon;
@end

@implementation FDPopMenuItem

- (instancetype)initWithTitle:(NSString*)title
                         icon:(UIImage*)icon {
    if (self = [super init]) {
        NSParameterAssert(title || icon);
        
        _title = title;
        _icon = icon;
    }
    return self;
}
@end

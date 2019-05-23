//
//  FDLottieShapeItem.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/22.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDLottieShapeItem.h"

@interface FDLottieShapeItem ()

/// The name of the shape
@property(copy, nonatomic)NSString* name;

/// The type of shape
@property(copy, nonatomic)NSString* type;

@property(strong, nonatomic)NSNumber* hidden;
@end


@implementation FDLottieShapeItem

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"nm"];
        self.type = [aDecoder decodeObjectForKey:@"ty"];
        self.hidden = [aDecoder decodeObjectForKey:@"hd"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
}
@end

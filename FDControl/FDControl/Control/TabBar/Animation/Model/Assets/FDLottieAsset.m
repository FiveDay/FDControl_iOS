//
//  FDLottieAsset.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/23.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDLottieAsset.h"


@interface FDLottieAsset ()
@property(copy, nonatomic)NSString* identity;



@end

@implementation FDLottieAsset

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.identity = [aDecoder decodeObjectForKey:@"id"];
        

    }
    return self;
}
@end

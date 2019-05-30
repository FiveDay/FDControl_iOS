//
//  FDLottieAnimationView.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/30.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDLottieAnimationView.h"
#import "FDLottieComposition.h"

@implementation FDLottieAnimationView

+ (nullable instancetype)animationWithNamed:(NSString*)name {
    FDLottieComposition* model = [FDLottieComposition animationNamed:name];
    return [[self alloc]initWithModel:model];
}

- (instancetype)initWithModel:(FDLottieComposition*)model {
    CGRect frame = CGRectZero;
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}
@end

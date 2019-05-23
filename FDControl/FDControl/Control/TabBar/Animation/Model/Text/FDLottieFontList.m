//
//  FDLottieFontList.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/23.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDLottieFontList.h"

@interface FDLottieFont ()
@property(copy, nonatomic)NSString* name;
@property(copy, nonatomic)NSString* familyName;
@property(copy, nonatomic)NSString* style;
@property(strong, nonatomic)NSNumber* ascent;
@end

@implementation FDLottieFont

@end

@interface FDLottieFontList ()
@property(strong, nonatomic)NSArray<FDLottieFont*>* fonts;
@end

@implementation FDLottieFontList

@end

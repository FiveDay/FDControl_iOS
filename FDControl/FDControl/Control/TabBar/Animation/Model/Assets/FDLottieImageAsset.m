//
//  FDLottieImageAsset.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/23.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDLottieImageAsset.h"

@interface FDLottieImageAsset ()
@property(copy, nonatomic)NSString* name;
@property(copy, nonatomic)NSString* directory;
@property(strong, nonatomic)NSNumber* width;
@property(strong, nonatomic)NSNumber* height;
@end

@implementation FDLottieImageAsset

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"name" : @"p",
             @"directory" : @"u",
             @"width" : @"w",
             @"height" : @"h",
             };
}

//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    if (self = [super initWithCoder:aDecoder]) {
//        self.name = [aDecoder decodeObjectForKey:@"p"];
//        self.directory = [aDecoder decodeObjectForKey:@"u"];
//        self.width = [aDecoder decodeObjectForKey:@"w"];
//        self.height = [aDecoder decodeObjectForKey:@"h"];
//    }
//    return self;
//}
@end

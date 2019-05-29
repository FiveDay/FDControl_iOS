//
//  FDTestModel.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/29.
//  Copyright © 2019 zhangyu528. All rights reserved.
//
#import "FDTestModel.h"

@interface FDLayerModel : NSObject

@property(copy, nonatomic)NSString* name;
@end

@implementation FDLayerModel
- (nullable instancetype)initWithFDCoder:(FDCoder *)coder {
    if (self = [super init]) {
        self.name = [coder decode:[NSString class] key:@"nm"];
    }
    return self;
}
@end

@interface FDTestModel ()
@property(copy, nonatomic)NSString* version;
@property(strong, nonatomic)NSArray<FDLayerModel*>* layers;
@end

@implementation FDTestModel

- (nullable instancetype)initWithFDCoder:(FDCoder *)coder {
    if (self = [super init]) {
        self.version = [coder decode:[NSString class] key:@"v"];
        self.layers = [coder decode:[FDLayerModel class] key:@"layers"];
    }
    return self;
}

@end

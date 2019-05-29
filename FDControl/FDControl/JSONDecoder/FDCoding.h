//
//  FDCoding.h
//  FDControl
//
//  Created by zhangyu528 on 2019/5/29.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@class FDCoder;

@protocol FDCoding <NSObject>

- (nullable instancetype)initWithFDCoder:(FDCoder*)coder;

@end

NS_ASSUME_NONNULL_END

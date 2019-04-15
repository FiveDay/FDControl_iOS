//
//  FDRouterRegParam.h
//  FDControl
//
//  Created by zhangyu528 on 2019/4/15.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FDRouterRegParam : NSObject
@property(copy, nonatomic)NSString* path;
@property(strong, nonatomic)Class component;
@end

NS_ASSUME_NONNULL_END

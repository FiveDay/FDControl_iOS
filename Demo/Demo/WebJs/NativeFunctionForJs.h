//
//  NativeFunctionForJs.h
//  Demo
//
//  Created by zhangyu528 on 2019/4/10.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FDControl/FDControl.h>


NS_ASSUME_NONNULL_BEGIN

@interface NativeFunctionForJs : NSObject <FDNativeInterface>

- (NSDictionary*)getTokenUserId;

@end

NS_ASSUME_NONNULL_END

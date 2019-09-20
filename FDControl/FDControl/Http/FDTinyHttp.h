//
//  FDTinyHttp.h
//  FDControl
//
//  Created by zhangyu528 on 2019/9/20.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FDTinyRequestProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface FDTinyHttp : NSObject

+ (instancetype)shared;
- (void)setEnviorment:(NSString*)root;
- (void)startRequest:(id<FDTinyRequestProtocol> __nonnull)request completion:(void(*)(id __nullable response, NSError* __nullable error))completion;

@end

NS_ASSUME_NONNULL_END

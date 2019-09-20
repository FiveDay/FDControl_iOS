//
//  FDTinyRequestProtocol.h
//  FDControl
//
//  Created by zhangyu528 on 2019/9/20.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FDTinyRequestProtocol <NSObject>
- (NSDictionary*)params;
- (NSString*)path;
- (Class)responseClass;
@end

NS_ASSUME_NONNULL_END

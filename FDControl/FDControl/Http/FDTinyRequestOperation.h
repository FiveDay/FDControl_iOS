//
//  FDTinyRequestOperation.h
//  FDControl
//
//  Created by zhangyu528 on 2019/9/20.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Completion)(id _Nullable response, NSError* _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface FDTinyRequestOperation : NSOperation

+ (instancetype)new UNAVAILABLE_ATTRIBUTE;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;

- (instancetype)initWithRequest:(NSURLRequest* __nonnull)request
                        session:(NSURLSession* __nonnull)session
                     completion:(Completion)completion;
@end

NS_ASSUME_NONNULL_END

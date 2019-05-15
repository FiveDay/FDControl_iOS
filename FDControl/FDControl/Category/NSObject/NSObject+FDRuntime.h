//
//  NSObject+FDRuntime.h
//  FDControl
//
//  Created by zhangyu528 on 2019/5/15.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (FDRuntime)

- (id)performSelector:(SEL)selector withObjects:(NSArray*)objects;

@end

NS_ASSUME_NONNULL_END

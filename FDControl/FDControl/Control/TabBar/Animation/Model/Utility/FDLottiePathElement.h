//
//  FDLottiePathElement.h
//  FDControl
//
//  Created by zhangyu528 on 2019/5/23.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 A path section, containing one point and its length to the previous point.
 
 The relationship between this path element and the previous is implicit.
 Ideally a path section would be defined by two vertices and a length.
 We don't do this however, as it would effectively double the memory footprint
 of path data.
 
 */

NS_ASSUME_NONNULL_BEGIN

@interface FDLottiePathElement : NSObject

@end

NS_ASSUME_NONNULL_END

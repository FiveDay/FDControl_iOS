//
//  FDWebImageManager.h
//  FDControl
//
//  Created by zhangyu528 on 2019/3/15.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^FDWebImageManagerCompletedBlock)(UIImage * _Nullable image, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface FDWebImageManager : NSObject

+ (instancetype)shared;

- (void)loadImageWith:(nonnull NSURL*)url completed:(nullable FDWebImageManagerCompletedBlock)completedBlock;

@end

NS_ASSUME_NONNULL_END

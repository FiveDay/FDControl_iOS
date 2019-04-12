//
//  FDWebImageDownloaderOperation.h
//  FDControl
//
//  Created by zhangyu528 on 2019/3/15.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^FDWebImageDownloaderOperationCompletedBlock)(UIImage * _Nullable image, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface FDWebImageDownloaderOperation : NSOperation

+ (instancetype)new UNAVAILABLE_ATTRIBUTE;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;

- (instancetype)initWithRequest:(NSURLRequest*)request
                        session:(NSURLSession*)session
                 completedBlock:(nullable FDWebImageDownloaderOperationCompletedBlock)completedBlock;
@end

NS_ASSUME_NONNULL_END

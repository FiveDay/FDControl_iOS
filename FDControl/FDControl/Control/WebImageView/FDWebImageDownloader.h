//
//  FDWebImageDownloader.h
//  FDControl
//
//  Created by zhangyu528 on 2019/3/14.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^FDWebImageDownloaderCompletedBlock)(UIImage * _Nullable image, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface FDWebImageDownloader : NSObject


- (void)downloadImageWithURL:(NSURL*)url completed:(nullable FDWebImageDownloaderCompletedBlock)completedBlock;

@end

NS_ASSUME_NONNULL_END

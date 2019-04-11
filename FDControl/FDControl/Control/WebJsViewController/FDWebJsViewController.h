//
//  FDWebJsViewController.h
//  FDControl
//
//  Created by zhangyu528 on 2019/4/9.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FDNativeInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FDWebJsViewController : UIViewController

typedef void (^FDWebResponseCallback)(id responseData);

@property(nonatomic, strong, nullable)NSURL* url;
@property(nonatomic, copy, nullable)NSString* navTitle;

@property(nonatomic, strong, nullable)id <FDNativeInterface> nativeDelegate;

- (void)callJsHandler:(NSString*)name data:(id)data response:(FDWebResponseCallback)response;

@end

NS_ASSUME_NONNULL_END

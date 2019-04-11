//
//  FDWebViewJavascriptBridge.h
//  FDControl
//
//  Created by zhangyu528 on 2019/4/11.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "WKWebViewJavascriptBridge.h"
#import "FDNativeInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FDWebViewJavascriptBridge : WKWebViewJavascriptBridge

- (void)installNative:(id <FDNativeInterface>)delegate;

@end

NS_ASSUME_NONNULL_END

//
//  FDWebViewJavascriptBridge.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/11.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDWebViewJavascriptBridge.h"
#import "FDControl.h"

@implementation FDWebViewJavascriptBridge

- (void)installNative:(id <FDNativeInterface>)delegate {

    NSObject* native = delegate;
    NSArray<NSString*>* names = [[native class] getMethodNameArray];
    for (NSString* name in names) {
        SEL sel = NSSelectorFromString(name);
        if ([delegate respondsToSelector:sel]) {
            NSCharacterSet* set = [NSCharacterSet characterSetWithCharactersInString:@":"];
            NSString* jsName = [name stringByTrimmingCharactersInSet:set];
            [self registerHandler:jsName handler:^(id data, WVJBResponseCallback responseCallback) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                NSDictionary* response = [delegate performSelector:sel withObject:data];
#pragma clang diagnostic pop
                responseCallback([response fd_toJSONString]);
            }];
        }
    }
}
@end

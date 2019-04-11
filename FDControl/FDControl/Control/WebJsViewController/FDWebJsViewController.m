//
//  FDWebJsViewController.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/9.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDWebJsViewController.h"

#import <WebKit/WebKit.h>
#import "FDWebViewJavascriptBridge.h"
#import "FDWebProgressView.h"

@interface FDWebJsViewController () <WKNavigationDelegate>
@property(strong, nonatomic)FDWebViewJavascriptBridge* jsBridge;

@property(strong, nonatomic, nonnull)WKWebView* webView;
@property(strong, nonatomic, nonnull)FDWebProgressView* progressView;
@end

@implementation FDWebJsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    _progressView = [[FDWebProgressView alloc]init];
    _progressView.progressTintColor = [UIColor blueColor];
    
    _webView = [WKWebView new];
    _webView.navigationDelegate = self;
    [_webView addObserver:_progressView forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [self.view addSubview:_webView];

    if (self.url) {
        NSURLRequest* request = [[NSURLRequest alloc]initWithURL:self.url];
        [_webView loadRequest:request];
    }
    [self.view addSubview:_progressView];
    
    [self jsBridgeInitWithWebView:_webView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.webView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.progressView.frame = CGRectMake(0, -self.webView.scrollView.contentOffset.y, self.view.frame.size.width, 2);
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
}

- (void)dealloc {
    [_webView removeObserver:_progressView forKeyPath:@"estimatedProgress"];
}

- (void)jsBridgeInitWithWebView:(id)webView {
#ifdef DEBUG
    [FDWebViewJavascriptBridge enableLogging];
#endif
    _jsBridge = [FDWebViewJavascriptBridge bridgeForWebView:webView];
    [_jsBridge setWebViewDelegate:self];
    [_jsBridge installNative:self.nativeDelegate];
}

//开始加载
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    [self.progressView startProgress];
}

//加载完成
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {    
    [self.progressView endProgress];
}

//加载失败
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation {
}

- (void)callJsHandler:(NSString*)name data:(id)data response:(FDWebResponseCallback)response {
    [self.jsBridge callHandler:name data:data responseCallback:response];
}
@end

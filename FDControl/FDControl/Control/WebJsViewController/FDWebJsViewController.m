//
//  FDWebJsViewController.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/9.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDWebJsViewController.h"

#import <WebKit/WebKit.h>
#import "WebViewJavascriptBridge.h"
#import "FDControl.h"

@interface FDWebJsViewController () <WKNavigationDelegate>
@property(strong, nonatomic)WebViewJavascriptBridge* jsBridge;

@property(strong, nonatomic, nonnull)WKWebView* webView;
@property(strong, nonatomic, nonnull)UIProgressView* progressView;
@end

@implementation FDWebJsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    _webView = [WKWebView new];
    _webView.navigationDelegate = self;
    [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [self.view addSubview:_webView];

    if (self.url) {
        NSURLRequest* request = [[NSURLRequest alloc]initWithURL:self.url];
        [_webView loadRequest:request];
    }
    [self.view addSubview:self.progressView];
    
    [self jsBridgeInitWithWebView:_webView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.webView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.progressView.frame = CGRectMake(0, -self.webView.scrollView.contentOffset.y, self.view.frame.size.width, 2);
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
}

- (void)dealloc {
    [_webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)jsBridgeInitWithWebView:(id)webView {
#ifdef DEBUG
    [WebViewJavascriptBridge enableLogging];
#endif
    _jsBridge = [WebViewJavascriptBridge bridgeForWebView:webView];
    [_jsBridge setWebViewDelegate:self];
    
    __weak typeof (self)weakSelf = self;
    NSObject* native = self.nativeDelegate;
    NSArray<NSString*>* names = [native getMethodNameArray];
    for (NSString* name in names) {
        SEL sel = NSSelectorFromString(name);
        if ([self.nativeDelegate respondsToSelector:sel]) {
            [self.jsBridge registerHandler:name handler:^(id data, WVJBResponseCallback responseCallback) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                NSDictionary* response = [weakSelf.nativeDelegate performSelector:sel];
#pragma clang diagnostic pop
                NSLog(@"%@", [response fd_toJSONString]);
                responseCallback([response fd_toJSONString]);
            }];
        }
    }
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progressView.progress = self.webView.estimatedProgress;
        if (self.progressView.progress == 1) {
            /*
             *添加一个简单的动画，将progressView的Height变为1.4倍，在开始加载网页的代理中会恢复为1.5倍
             *动画时长0.25s，延时0.3s后开始动画
             *动画结束后将progressView隐藏
             */
            __weak typeof (self)weakSelf = self;
            [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                weakSelf.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.4f);
            } completion:^(BOOL finished) {
                weakSelf.progressView.hidden = YES;
                
            }];
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

//开始加载
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    //开始加载网页时展示出progressView
    self.progressView.hidden = NO;
    //开始加载网页的时候将progressView的Height恢复为1.5倍
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    //防止progressView被网页挡住
    [self.view bringSubviewToFront:self.progressView];
}

//加载完成
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {    
    //加载完成后隐藏progressView
    self.progressView.hidden = YES;
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation {
}

- (UIProgressView*)progressView {
    if (_progressView) {
        return _progressView;
    }
    _progressView = [[UIProgressView alloc]init];
    _progressView.progressTintColor = [UIColor blueColor];
    return _progressView;
}
@end

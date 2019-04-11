//
//  FDWebProgressView.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/11.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDWebProgressView.h"
#import <WebKit/WebKit.h>

@implementation FDWebProgressView

- (void)startProgress {
    //开始加载网页时展示出progressView
    self.hidden = NO;
    //开始加载网页的时候将progressView的Height恢复为1.5倍
    self.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
}

- (void)endProgress {
    //加载完成后隐藏progressView
    self.hidden = YES;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    WKWebView* webView = object;
    if ([webView isKindOfClass:[WKWebView class]]
        &&[keyPath isEqualToString:@"estimatedProgress"]) {
        self.progress = webView.estimatedProgress;
        if (self.progress == 1) {
            /*
             *添加一个简单的动画，将progressView的Height变为1.4倍，在开始加载网页的代理中会恢复为1.5倍
             *动画时长0.25s，延时0.3s后开始动画
             *动画结束后将progressView隐藏
             */
            __weak typeof (self)weakSelf = self;
            [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                weakSelf.transform = CGAffineTransformMakeScale(1.0f, 1.4f);
            } completion:^(BOOL finished) {
                weakSelf.hidden = YES;
                
            }];
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

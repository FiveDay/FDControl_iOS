//
//  FDUserGuideView.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/8.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDUserGuideView.h"
#import "FDControl.h"

@interface FDUserGuideView () <UIScrollViewDelegate>
@property(strong, nonatomic)UIScrollView* scrollView;
@property(strong, nonatomic)UIPageControl* pageControl;
@property(strong, nonatomic)UIButton* startBtn;
@property(strong, nonatomic)NSArray<UIImage*>* images;
@end

@implementation FDUserGuideView

- (instancetype)initWithImages:(NSArray<UIImage*>*)images {
    CGRect frame = [UIScreen mainScreen].bounds;
    if ([self initWithFrame:frame]) {
        _images = images;
        
        _scrollView = [UIScrollView new];        
        _scrollView.frame = frame;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
        [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width*[images count], _scrollView.frame.size.height)];
        [self addSubview:_scrollView];
        
        _pageControl = [UIPageControl new];
        _pageControl.numberOfPages = [_images count];
        _pageControl.currentPageIndicatorTintColor = [UIColor colorWithHexString:@"#4e96fb"];
        _pageControl.pageIndicatorTintColor = [UIColor colorWithHexString:@"#b2d2ff"];
        [self addSubview:_pageControl];
        
        NSInteger index = 0;
        for (UIImage* image in _images) {
            UIImageView* imageView = [[UIImageView alloc]initWithImage:image];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            imageView.width = _scrollView.width;
            imageView.height = imageView.width * (image.size.height / image.size.width);
            imageView.top = 30;
            imageView.left = _scrollView.width * index;
            index ++;
            [_scrollView addSubview:imageView];
        }
        _startBtn = [UIButton new];
        _startBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
        [_startBtn setTitle:@"立即体验" forState:UIControlStateNormal];
        [_startBtn setTitleColor:[UIColor colorWithHexString:@"#548afc"] forState:(UIControlStateNormal)];
        _startBtn.layer.borderColor = [UIColor colorWithHexString:@"#548afc"].CGColor;
        _startBtn.layer.masksToBounds = YES;
        _startBtn.layer.cornerRadius = 4;
        _startBtn.layer.borderWidth = 0.5;
        _startBtn.width = self.width - 78.5 * 2;
        _startBtn.height = 48;
        _startBtn.centerX = _scrollView.frame.size.width*([images count] - 1) + self.width / 2;
        _startBtn.bottom = self.height - 40;
        [_scrollView addSubview:_startBtn];
    }
    return self;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    // 记录scrollView 的当前位置，因为已经设置了分页效果，所以：位置/屏幕大小 = 第几页
    int current = scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width;
    
    //根据scrollView 的位置对page 的当前页赋值
    self.pageControl.currentPage = current;
    if (current == [self.images count]) {
        [self.pageControl setHidden:YES];
    } else {
        [self.pageControl setHidden:NO];
    }
}
@end

# FDControl_iOS
公共组件
## Feature
* 设备权限申请管理
* 用户引导页面
* 垂直布局Button
* 支持线性&径向渐变颜色Button
* 支持Loading状态的Button
* 支持校验（手机号，姓名，身份证，邮箱，金额）TextField
* 支持内间距Label
* SegmentTitleControl控件
* ActivityIndicator控件
* 日历组件
* UITabBarController支持中间凸起Button和点击Lotties动画效果

## Installation
### Carthage
For Carthage, add the following to your Cartfile:

github "FiveDay/FDControl_iOS"

## Getting Started

```objc
#import <FDControl/FDControl.h>
```

#### Button

```objc
#import <FDControl/FDControl.h>
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton* vBtn = [UIButton buttonWithVerticalType];
    vBtn.frame = CGRectMake(0, 100, 100, 100);
    vBtn.image = [UIImage imageNamed:@"image"];
    vBtn.title = @"abc";
    [vBtn setBackgroundGradientColor:[UIColor colorWithHexString:@"#12c2e9"] endColor:[UIColor colorWithHexString:@"#c471ed"]];
    vBtn.cornerRadius = 4;
    [self.view addSubview:vBtn];
    vBtn.onClick = ^(UIControl * _Nonnull sender) {
        sender.backgroundColor = [UIColor redColor];
        [((UIButton*)sender)hideLoading];
    };
    
    [vBtn showLoading];
}
```

#### UserGuideView

```objc
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage* img01 = [UIImage imageNamed:@"01"];
    UIImage* img02 = [UIImage imageNamed:@"02"];
    UIImage* img03 = [UIImage imageNamed:@"03"];
    UIImage* img04 = [UIImage imageNamed:@"04"];
    FDUserGuideView* guide = [[FDUserGuideView alloc]initWithImages:@[img01, img02, img03, img04]];
    [self.view addSubview:guide];
}
```

#### TabBarController
```objc
```
//
//  ViewController.m
//  Demo
//
//  Created by zhangyu528 on 2018/12/11.
//  Copyright © 2018 zhangyu528. All rights reserved.
//

#import "ViewController.h"

#import <FDControl/FDControl.h>
#import <UIKit/UITableViewController.h>

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

//存放测试vc的交互容器
@property(nonatomic, strong) UITableViewController* tableViewController;

//存放测试vc类名、用于tableview数据显示
@property(nonatomic, strong) NSMutableArray* testVCClassNameArray;

//导航控制器
//@property(nonatomic, strong) UINavigationController* navigationController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    int safetop = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    
    //[test1] loading测试
    FDActivityIndicatorView* activity = [[FDActivityIndicatorView alloc]initWithFrame:CGRectMake(100, safetop, 100, 100)];
    [self.view addSubview:activity];
    [activity startAnimating];
    
    //[test2] fdWebImage测试
    UIImageView* webImageView = [UIImageView new];
    webImageView.top = safetop;
    webImageView.width = 100;
    webImageView.height = 100;
    [webImageView fd_setImageWithURL:[NSURL URLWithString:@"http://www.pptbz.com/pptpic/UploadFiles_6909/201203/2012031220134655.jpg"] placeholderImage:nil];
    [self.view addSubview:webImageView];
    
    //[test3] md5测试
    NSString* string = [NSString new];
    string = @"";
    NSString* md5 = [string fd_toMD5String16];
    NSLog(@"md5:%@", md5);
    

    //添加tableviewcontroller
    [self addChildViewController:self.tableViewController];
    [self.view addSubview:self.tableViewController.tableView];
    
    //添加测试vc
    [self.testVCClassNameArray addObject:@"UIImageViewDecoderViewController"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - lazy
- (UITableViewController*)tableViewController
{
    int safetop = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    
    if (!_tableViewController) {
        _tableViewController = [[UITableViewController alloc]initWithStyle:UITableViewStylePlain];
        _tableViewController.tableView.frame = (CGRect){{0,100+safetop},{CGRectGetWidth(self.view.frame),CGRectGetHeight(self.view.frame)-100-safetop}};
        
        _tableViewController.tableView.delegate = self;
        _tableViewController.tableView.dataSource = self;
    }
    
    return _tableViewController;
}

- (NSMutableArray*)testVCClassNameArray
{
    if (!_testVCClassNameArray) {
        _testVCClassNameArray = [NSMutableArray arrayWithCapacity:0];
        
    }
    
    return _testVCClassNameArray;
}

# pragma mark - delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row >= self.testVCClassNameArray.count) {
        return ;
    }
    
    UITableViewCell* selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    [selectedCell setSelected:NO];
    
    //点击cell
    //1: 创建对象
    Class cls = NSClassFromString(self.testVCClassNameArray[indexPath.row]);
    if (!cls) {
        return ;
    }
    
    UIViewController* dynamicCreatedViewController = [[cls alloc]init];
    
    [self.navigationController pushViewController:dynamicCreatedViewController animated:YES];
    
}

# pragma mark - dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.testVCClassNameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row >= self.testVCClassNameArray.count) {
        return nil;
    }
    
    NSString* commonIdentifier = @"cell_identifier";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:commonIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:commonIdentifier];
    }
    
    //设置cell相关内容
    [cell.textLabel setText:self.testVCClassNameArray[indexPath.row]];
    
    return cell;
}
@end

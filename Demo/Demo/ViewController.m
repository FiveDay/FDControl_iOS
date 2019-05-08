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
    
    //添加tableviewcontroller
    [self addChildViewController:self.tableViewController];
    [self.view addSubview:self.tableViewController.tableView];
    
    //添加测试vc
    [self.testVCClassNameArray addObject:@"audio"];
    [self.testVCClassNameArray addObject:@"router"];
    [self.testVCClassNameArray addObject:@"butten"];
    [self.testVCClassNameArray addObject:@"guide"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - lazy
- (UITableViewController*)tableViewController
{    
    if (!_tableViewController) {
        _tableViewController = [[UITableViewController alloc]initWithStyle:UITableViewStylePlain];
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
    
    [self.navigationController navToName:self.testVCClassNameArray[indexPath.row] param:nil];
    
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

//
//  RuleViewController.m
//  DriveTest
//
//  Created by 王颜华 on 15/11/11.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "RuleViewController.h"

@interface RuleViewController ()

@end

@implementation RuleViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(popAction:)];
    }
    return self;
}

- (void)popAction:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.scrollEnabled = NO;
    self.tableView.tableFooterView = ({
        UIView *view = [[UIView alloc] init];
        view;
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"2013年《机动车驾驶证申领和使用规定》";
        cell.detailTextLabel.text = @"机动车驾驶证申领和使用规定";
        cell.imageView.image = [UIImage imageNamed:@"a1"];
        
    }
    else if (indexPath.row == 1)
    {
        cell.textLabel.text = @"2015驾校考驾照规定";
        cell.detailTextLabel.text = @"驾校考驾照规定";
        cell.imageView.image = [UIImage imageNamed:@"a2"];
        
    }
    else if (indexPath.row == 2)
    {
        cell.textLabel.text = @"道路交通安全违法行为记分分值（2015版）";
        cell.detailTextLabel.text = @"违法行为记分分值";
        cell.imageView.image = [UIImage imageNamed:@"a3"];
        
    }
    else
    {
        cell.textLabel.text = @"醉驾处罚-2015版酒驾醉驾处罚";
        cell.detailTextLabel.text = @"醉驾处罚";
        cell.imageView.image = [UIImage imageNamed:@"a4"];
        
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestMethodVC *testMethod = [TestMethodVC new];
    
    if (indexPath.row == 0) {
        testMethod.title =  @"机动车驾驶证申领和使用规则";
        testMethod.url = testRule1;
    }
    else if (indexPath.row == 1)
    {
        testMethod.title =  @"2015驾校考驾照规定";
        testMethod.url = testRule2;
    }
    else if (indexPath.row == 2)
    {
        testMethod.title =  @"道路交通安全违法行为记分分值";
        testMethod.url = testRule3;
    }
    else
    {
        testMethod.title =  @"醉驾处罚";
        testMethod.url = testRule4;
    }
    [testMethod setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:testMethod animated:YES];
}


@end

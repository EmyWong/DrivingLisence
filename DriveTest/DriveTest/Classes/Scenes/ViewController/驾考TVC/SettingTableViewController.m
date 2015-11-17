//
//  SettingTableViewController.m
//  DriveTest
//
//  Created by jinke on 15/11/17.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "SettingTableViewController.h"
#import "SettingCell.h"
#import "FileService.h"
#import "InfoTVC.h"
@interface SettingTableViewController ()<UIAlertViewDelegate>
@property (nonatomic,retain) NSString *cachePath;
@property (nonatomic,strong) UIAlertView *hcAlertView;
@property (nonatomic,strong) SettingCell *cell1;
@end

@implementation SettingTableViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"设置";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //缓存路径
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    self.cachePath = [[paths objectAtIndex:0] stringByAppendingFormat:@"/Caches"];
    

    self.tableView.scrollEnabled = NO;
    self.tableView.tableFooterView = ({
        UIView *view = [[UIView alloc] init];
        view;
    });
    [self.tableView registerClass:[SettingCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"systemcell"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return kScreenHight*240/667;
    }
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"systemcell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    if (indexPath.row == 0) {
         self.cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell" ];
         _cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        return _cell1;
    }
    else if (indexPath.row == 1)
    {
        cell.imageView.image = [UIImage imageNamed:@"a1"];
        cell.textLabel.text = @"个人信息";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else
    {
    cell.imageView.image = [UIImage imageNamed:@"a2"];
    cell.textLabel.text = @"清除缓存";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    }
   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return;
    }
    else if (indexPath.row == 1)
    {
        InfoTVC *infoTvc = [InfoTVC new];
        infoTvc.title = @"个人信息";
        infoTvc.passimage = ^(UIImage *image)
        {
            self.cell1.HeadImage.image = image;
        };
        [self.navigationController pushViewController:infoTvc animated:YES];
    }
    else
    {
        CGFloat size = [FileService folderSizeAtPath:self.cachePath];
        if (size > .01f )
        {
            self.hcAlertView = [[UIAlertView alloc]initWithTitle:@"提示" message:[NSString stringWithFormat:@"缓存大小为%.2fM，确定要清除缓存吗",size]delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [self.hcAlertView show];
            
        }
        else
        {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"暂时没有缓存" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
            [alertView show];
        }

    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView == self.hcAlertView   && buttonIndex == 1) {
        [FileService clearCache:self.cachePath];
        UIAlertView *alertView1 = [[UIAlertView alloc]initWithTitle:@"提示" message:@"清除缓存成功" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alertView1 show];
    }
}

@end

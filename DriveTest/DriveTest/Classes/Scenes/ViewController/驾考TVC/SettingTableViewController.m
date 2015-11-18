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

@property (nonatomic,strong) InfoTVC *infoTvc;
@property (nonatomic,strong) UIAlertView *zxalertView;
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
- (void)viewWillAppear:(BOOL)animated
{
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"iconimage"]) {
        self.cell1.HeadImage.image = [UIImage imageWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"iconimage"]];
        
    }
    else
    {
        self.cell1.HeadImage.image = [UIImage imageNamed:@"touxiang.jpg"];
    }
    if ([[NSUserDefaults standardUserDefaults]valueForKey:@"nickname"]) {
    
        [self.cell1.accountName setTitle:[[NSUserDefaults standardUserDefaults]valueForKey:@"nickname"] forState:(UIControlStateNormal)];
    }
    else
    {
        [self.cell1.accountName setTitle:@"未设置昵称" forState:(UIControlStateNormal)];
    
    }

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.infoTvc = [InfoTVC new];
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

    return 4;
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
    else if (indexPath.row == 2)
    {
    cell.imageView.image = [UIImage imageNamed:@"a2"];
    cell.textLabel.text = @"清除缓存";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    }
    else
    {
        cell.imageView.image = [UIImage imageNamed:@"a3"];
        cell.textLabel.text = @"注销账号";
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
        self.infoTvc.title = @"个人信息";
        
        __weak typeof(self)temp = self;
        self.infoTvc.passimage = ^(UIImage *image)
        {
            temp.cell1.HeadImage.image = image;
        };
        self.infoTvc.passvalue = ^(NSString *value)
        {
            temp.cell1.userName.text = value;
        };
        AppDelegate *app = [UIApplication sharedApplication].delegate;
        
        if (app.loginType == YES) {

        [self.navigationController pushViewController:self.infoTvc animated:YES];
        [self.infoTvc viewWillAppear:YES];
        }
        else
        {
            TimerDisappearAlertView *alertView = [[TimerDisappearAlertView alloc]initWithTitle:@"你还没有登录哦"];
            [alertView show];
        }
    }
    else if (indexPath.row == 2)
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
    else
    {
        AppDelegate *app = [UIApplication sharedApplication].delegate;
        
     if (app.loginType == YES) {
       
        self.zxalertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"确定要注销吗" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [self.zxalertView show];
     }
    else
    {
        TimerDisappearAlertView *alertView = [[TimerDisappearAlertView alloc]initWithTitle:@"你还没有登录哦"];
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
    if (alertView == self.zxalertView && buttonIndex == 1) {
        
        AppDelegate *app = [UIApplication sharedApplication].delegate;
        app.loginType = NO;
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"iconimage"];
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"nickname"];
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"sex"];
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"sign"];
        [self viewWillAppear:YES];
        TimerDisappearAlertView *alertView = [[TimerDisappearAlertView alloc]initWithTitle:@"注销成功"];
        [alertView show];
    }
}

@end

//
//  ClassFourTestTVC.m
//  DriveTest
//
//  Created by lanou3g on 15/11/10.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "ClassFourTestTVC.h"

@interface ClassFourTestTVC ()
{
    ListHelper * listHelper;
}


@property (nonatomic, strong) UIImageView *imgVIew;

@end

@implementation ClassFourTestTVC

static NSString *const classFourCellId = @"ClassFourID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationController.navigationBar.translucent = NO;
    
    //注册自定义cell
    [self.tableView registerNib:[UINib nibWithNibName:@"ClassFourCell" bundle:nil]forCellReuseIdentifier:classFourCellId];
    
    //加载头视图
    [self loadHeaderImage];
    
    //cell根据内容自适应高度
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    
    [self loadData];
}

- (void)loadData {
    NSURL *url = [NSURL URLWithString:@"http://bbs.api.jxedt.com/listcate/204/?createtime=0&pageindex=1"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //测试是否有网络连接
    if ([[NetWorkManager sharedWithManager] isConnectionAvailable]== NO) {
        
    }
    else
    {
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
            
            NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
            NSMutableDictionary *resultDic = dic[@"result"];
            listHelper = [ListHelper new];
            [listHelper setValuesForKeysWithDictionary:resultDic[@"list"]];
            [self.tableView reloadData];
        }];
    }
}




- (void)loadHeaderImage
{
    
    CGFloat offest = 150;
    
    self.tableView.contentInset = UIEdgeInsetsMake(offest, 0, 0, 0);
    self.imgVIew = [[UIImageView alloc] init];
    self.imgVIew.frame = CGRectMake(0, -offest, kScreenWidth, offest);
    self.imgVIew.image = [UIImage imageNamed:@"image090"];
    [self.tableView addSubview:self.imgVIew];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ClassFourCell *cell = [tableView dequeueReusableCellWithIdentifier:classFourCellId forIndexPath:indexPath];
    cell.listHelper = listHelper;

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    if (indexPath.row != 0) {
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        //cell点击时不显示不显示选状态
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    //加载cell上buuton的点击事件
    [self loadAction:cell];
    
    //cell点击时不显示不显示选状态
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}


- (void)loadAction:(ClassFourCell *)sender
{
    //顺序测试按钮添加监听事件
    [sender.shunXuButton addTarget:self action:@selector(shunXuTestAction) forControlEvents:UIControlEventTouchUpInside];
    //随机测试按钮添加监听事件
    [sender.suiJiButton addTarget:self action:@selector(suiJiTestAction) forControlEvents:UIControlEventTouchUpInside];
    //驾考法规按钮添加监听事件
    [sender.faGuiButton addTarget:self action:@selector(faGuiAction) forControlEvents:UIControlEventTouchUpInside];
    //考试技巧按钮添加监听事件
    [sender.kaoShiButton addTarget:self action:@selector(kaoShiAction) forControlEvents:UIControlEventTouchUpInside];
    
    //评论按钮添加监听事件
    [sender.commentButton addTarget:self action:@selector(commentAction) forControlEvents:UIControlEventTouchUpInside];
}

//顺序测试按钮
- (void)shunXuTestAction
{
    ViewController *orderVC = [ViewController new];
    orderVC.weburl = c1k4orderUrl;
    orderVC.title = @"顺序练习";
    [self.navigationController pushViewController:orderVC animated:YES];
}

//随机测试按钮
- (void)suiJiTestAction
{
    ViewController *orderVC = [ViewController new];
    orderVC.weburl = c1k4randUrl;
    orderVC.title = @"随机练习";
    [self.navigationController pushViewController:orderVC animated:YES];
}

//驾考法规按钮
- (void)faGuiAction
{
    RuleViewController *ruleVC = [RuleViewController new];
    ruleVC.title = @"驾考法规";
    [ruleVC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:ruleVC animated:YES];
}

//考试技巧按钮
- (void)kaoShiAction
{
    TestMethodVC *testMethod = [TestMethodVC new];
    testMethod.title =  @"考试技巧";
    testMethod.url = k4testmethod;
    [testMethod setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:testMethod animated:YES];
}

//评论按钮
- (void)commentAction
{
    TaoLunTVC * VC = [TaoLunTVC new];
    UINavigationController *NC = [[UINavigationController alloc] initWithRootViewController:VC];
    VC.infoid = @"204";
    VC.articletip = listHelper.totalusercount;
    VC.title = @"科目四";
    [self presentViewController:NC animated:YES completion:nil];
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

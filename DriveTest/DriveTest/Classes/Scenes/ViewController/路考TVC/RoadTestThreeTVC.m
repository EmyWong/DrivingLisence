//
//  RoadTestThreeTVC.m
//  DriveTest
//
//  Created by lanou3g on 15/11/10.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "RoadTestThreeTVC.h"

@interface RoadTestThreeTVC ()
{
    ListHelper * listHelper;
}

@end

@implementation RoadTestThreeTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"333");
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ThRreeCell" bundle:nil] forCellReuseIdentifier:@"threecellid"];
    
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    
    [self loadData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)loadData {
    NSURL *url = [NSURL URLWithString:@"http://bbs.api.jxedt.com/listcate/203/?createtime=0&pageindex=1"];
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ThRreeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"threecellid" forIndexPath:indexPath];
    cell.listHelper = listHelper;

  

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    if (indexPath.row != 0) {
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        //cell点击时不显示不显示选状态
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }
    
    
    //加载cell上buuton的点击事件
//    [self loadAction:cell];
    
    //加载cell上buuton的点击事件
    [self loadThreeAction:cell];
    
    
    
    //cell点击时不显示不显示选状态
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    
    return cell;
}


- (void)loadThreeAction:(ThRreeCell *)sender
{
    //评判标准按钮添加监听事件
    [sender.pingpanbiaozhun addTarget:self action:@selector(pingPanAction) forControlEvents:UIControlEventTouchUpInside];
    //路考秘诀按钮添加监听事件
    [sender.lukaomijue addTarget:self action:@selector(roadTestAction) forControlEvents:UIControlEventTouchUpInside];
    
    //秘籍指导按钮添加监听事件
    [sender.mijizhidao addTarget:self action:@selector(miJiAction) forControlEvents:UIControlEventTouchUpInside];
    //考场经验按钮添加监听事件
    [sender.kaoshijingtan addTarget:self action:@selector(kaoChangAction) forControlEvents:UIControlEventTouchUpInside];
    
    //评论按钮添加监听事件
    [sender.comment addTarget:self action:@selector(commentAction) forControlEvents:UIControlEventTouchUpInside];
    
#warning 需要添加
    [sender.xiaotieshi addTarget:self action:@selector(xiaoTieShiAction) forControlEvents:UIControlEventTouchUpInside];
    
}




//评判标准按钮
- (void)pingPanAction
{
    TestMethodVC *testMethod = [TestMethodVC new];
    testMethod.title =  @"评判标准";
    testMethod.url = k3standardUrl;
    [testMethod setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:testMethod animated:YES];
}



//路考秘诀按钮
- (void)roadTestAction
{
    TestMethodVC *testMethod = [TestMethodVC new];
    testMethod.title =  @"路考秘诀";
    testMethod.url = k3secretUrl;
    [testMethod setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:testMethod animated:YES];
}

//考场经验按钮
- (void)kaoChangAction
{
    TestMethodVC *testMethod = [TestMethodVC new];
    testMethod.title =  @"考场经验";
    testMethod.url = k3ExpericeUrl;
    [testMethod setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:testMethod animated:YES];
}

//秘籍指导按钮
- (void)miJiAction
{
    TestMethodVC *testMethod = [TestMethodVC new];
    testMethod.title =  @"秘籍指导";
    testMethod.url = k3testmethod;
    [testMethod setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:testMethod animated:YES];
}

//评论按钮
- (void)commentAction
{
    TaoLunTVC * VC = [TaoLunTVC new];
    UINavigationController *NC = [[UINavigationController alloc] initWithRootViewController:VC];
    VC.infoid = @"203";
    VC.articletip = listHelper.totalusercount;
    VC.title = @"科目三";
    [self presentViewController:NC animated:YES completion:nil];
}

//小贴士
- (void)xiaoTieShiAction
{
    NSLog(@"小贴士");
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

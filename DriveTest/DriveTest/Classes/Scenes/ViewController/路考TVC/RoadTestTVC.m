//
//  RoadTestTVC.m
//  DriveTest
//
//  Created by 王颜华 on 15/11/9.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "RoadTestTVC.h"

@interface RoadTestTVC ()
{
    ListHelper * listHelper;
}

@end

@implementation RoadTestTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationController.navigationBar.translucent = NO;
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"RoadTwoTestCell" bundle:nil] forCellReuseIdentifier:@"roadTwoID"];
    
    
    //
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    
    [self loadData];
}


- (void)loadData {
    NSURL *url = [NSURL URLWithString:@"http://bbs.api.jxedt.com/listcate/202/?createtime=0&pageindex=1"];
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
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RoadTwoTestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"roadTwoID" forIndexPath:indexPath];
    cell.listHelper = listHelper;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    if (indexPath.row != 0) {
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    
    //加载cell上buuton的点击事件
    [self loadAction:cell];
    
    //cell点击时不显示不显示选状态
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
   
    
    return cell;
}

- (void)loadAction:(RoadTwoTestCell *)sender
{
    //考前准备按钮添加监听事件
    [sender.kaoQianButton addTarget:self action:@selector(kaoQianAction) forControlEvents:UIControlEventTouchUpInside];
    //合格标准按钮添加监听事件
    [sender.heGeButton addTarget:self action:@selector(heGeAction) forControlEvents:UIControlEventTouchUpInside];
    //开始经验按钮添加监听事件
    [sender.jinYanButton addTarget:self action:@selector(jinYanAction) forControlEvents:UIControlEventTouchUpInside];
    //秘籍指导按钮添加监听事件
    [sender.miJiButton addTarget:self action:@selector(miJiAction) forControlEvents:UIControlEventTouchUpInside];
    
    //评论按钮添加监听事件
    [sender.commentButton addTarget:self action:@selector(commentAction) forControlEvents:UIControlEventTouchUpInside];
}


//考前准备按钮
- (void)kaoQianAction
{
    TestMethodVC *testMethod = [TestMethodVC new];
    testMethod.title =  @"考前准备";
    testMethod.url = k2PrapareUrl;
    [testMethod setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:testMethod animated:YES];
}

//合格标准按钮
- (void)heGeAction
{
    TestMethodVC *testMethod = [TestMethodVC new];
    testMethod.title =  @"合格标准";
    testMethod.url = k2standardUrl;
    [testMethod setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:testMethod animated:YES];
}

//开始经验按钮
- (void)jinYanAction
{
    TestMethodVC *testMethod = [TestMethodVC new];
    testMethod.title =  @"考试经验";
    testMethod.url = k2ShareUrl;
    [testMethod setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:testMethod animated:YES];
}

//秘籍指导按钮
- (void)miJiAction
{
    TestMethodVC *testMethod = [TestMethodVC new];
    testMethod.title =  @"秘籍指导";
    testMethod.url = k2testmethod;
    [testMethod setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:testMethod animated:YES];
}

//评论按钮
- (void)commentAction
{
    TaoLunTVC * VC = [TaoLunTVC new];
    UINavigationController *NC = [[UINavigationController alloc] initWithRootViewController:VC];
    VC.infoid = @"202";
    VC.articletip = listHelper.totalusercount;
    VC.title = @"科目二";
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

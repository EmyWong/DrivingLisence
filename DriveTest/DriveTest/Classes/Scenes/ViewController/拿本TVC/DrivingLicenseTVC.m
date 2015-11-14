//
//  DrivingLicenseTVC.m
//  DriveTest
//
//  Created by 王颜华 on 15/11/9.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "DrivingLicenseTVC.h"

@interface DrivingLicenseTVC ()
{
    ListHelper * listHelper;
}

@end

@implementation DrivingLicenseTVC
- (instancetype)init
{
    self = [super init];
    if (self) {
        //self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    }
    return self;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"naBenCell" bundle:nil] forCellReuseIdentifier:@"naBenCellID"];
    
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    [self loadData];
}


- (void)loadData {
    NSURL *url = [NSURL URLWithString:@"http://bbs.api.jxedt.com/listcate/209/?createtime=0&pageindex=1"];
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
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    naBenCell *cell = [tableView dequeueReusableCellWithIdentifier:@"naBenCellID" forIndexPath:indexPath];
    cell.listHelper = listHelper;
    //加载cell上buuton的点击事件
    [self loadAction:cell];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    
    return cell;
}



#pragma mark 拿本cell所有按钮监听事件


- (void)loadAction:(naBenCell *)sender
{
    //年检按钮
    [sender.nianJian addTarget:self action:@selector(nianJianAction) forControlEvents:UIControlEventTouchUpInside];
    //换证按钮
    [sender.huanZhen addTarget:self action:@selector(huanZhenAction) forControlEvents:UIControlEventTouchUpInside];
    //遗失按钮
    [sender.yiShi addTarget:self action:@selector(yiShiAction) forControlEvents:UIControlEventTouchUpInside];
    //挂失按钮
    [sender.guaShi addTarget:self action:@selector(guaShiAction) forControlEvents:UIControlEventTouchUpInside];
    
    //车辆操作大全
    [sender.caoZuoDaQuan addTarget:self action:@selector(caoZuoDaQuanAction) forControlEvents:UIControlEventTouchUpInside];
    //天气技巧
    [sender.tianQi addTarget:self action:@selector(tianQiAction) forControlEvents:UIControlEventTouchUpInside];
    //夜间技巧
    [sender.yeJian addTarget:self action:@selector(yeJianAction) forControlEvents:UIControlEventTouchUpInside];
    //刹车技巧
    [sender.shaChe addTarget:self action:@selector(shaCheAction) forControlEvents:UIControlEventTouchUpInside];
    //事故处理技巧
    [sender.chuLi addTarget:self action:@selector(chuLiAction) forControlEvents:UIControlEventTouchUpInside];
    //停车技巧
    [sender.tingChe addTarget:self action:@selector(tingCheAction) forControlEvents:UIControlEventTouchUpInside];
    
    //评论
    [sender.commentButton addTarget:self action:@selector(commentButtonAction) forControlEvents:UIControlEventTouchUpInside];
}

//年检按钮
- (void)nianJianAction
{
    DrivingLisenceVC *testMethod = [DrivingLisenceVC new];
    testMethod.title =  @"驾照年审、年检";
    testMethod.url = lisenceUrl1;
    [self.navigationController pushViewController:testMethod animated:YES];
}

//换证按钮
- (void)huanZhenAction
{
    DrivingLisenceVC *testMethod = [DrivingLisenceVC new];
    testMethod.title =  @"驾照换证";
    testMethod.url = lisenceUrl2;
    [self.navigationController pushViewController:testMethod animated:YES];
}

//遗失按钮
- (void)yiShiAction
{
    DrivingLisenceVC *testMethod = [DrivingLisenceVC new];
    testMethod.title =  @"驾照遗失";
    testMethod.url = lisenceUrl3;
    [self.navigationController pushViewController:testMethod animated:YES];
}

//挂失按钮
- (void)guaShiAction
{
    DrivingLisenceVC *testMethod = [DrivingLisenceVC new];
    testMethod.title =  @"驾照挂失";
    testMethod.url = lisenceUrl4;
    [self.navigationController pushViewController:testMethod animated:YES];
}


//车辆操作大全
- (void)caoZuoDaQuanAction
{
    DrivingLisenceVC *testMethod = [DrivingLisenceVC new];
    testMethod.title =  @"车辆操作大全";
    testMethod.url = methodUrl1;
    [self.navigationController pushViewController:testMethod animated:YES];
}

//天气技巧
- (void)tianQiAction
{
    DrivingLisenceVC *testMethod = [DrivingLisenceVC new];
    testMethod.title =  @"特殊天气驾驶技巧";
    testMethod.url = methodUrl2;
    [self.navigationController pushViewController:testMethod animated:YES];
}

//夜间技巧
- (void)yeJianAction
{
    DrivingLisenceVC *testMethod = [DrivingLisenceVC new];
    testMethod.title =  @"夜间行驶必备技巧";
    testMethod.url = methodUrl3;
    [self.navigationController pushViewController:testMethod animated:YES];
}

//刹车技巧
- (void)shaCheAction
{
    DrivingLisenceVC *testMethod = [DrivingLisenceVC new];
    testMethod.title =  @"刹车技巧";
    testMethod.url = methodUrl4;
    [testMethod setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:testMethod animated:YES];
}

//事故处理技巧
- (void)chuLiAction
{
    DrivingLisenceVC *testMethod = [DrivingLisenceVC new];
    testMethod.title =  @"事故处理技巧";
    testMethod.url = methodUrl5;
    [self.navigationController pushViewController:testMethod animated:YES];
}

//停车技巧
- (void)tingCheAction
{
    DrivingLisenceVC *testMethod = [DrivingLisenceVC new];
    testMethod.title =  @"必备停车技巧";
    testMethod.url = methodUrl6;
    [self.navigationController pushViewController:testMethod animated:YES];
}

//评论方法
- (void)commentButtonAction
{
    TaoLunTVC * VC = [TaoLunTVC new];
    UINavigationController *NC = [[UINavigationController alloc] initWithRootViewController:VC];
    VC.infoid = @"209";
    VC.articletip = listHelper.totalusercount;
    VC.title = @"拿本";
    [self presentViewController:NC animated:YES completion:nil];
}












//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 520;
//}
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

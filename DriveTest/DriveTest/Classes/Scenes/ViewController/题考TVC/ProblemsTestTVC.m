//
//  ProblemsTestTVC.m
//  DriveTest
//
//  Created by 王颜华 on 15/11/9.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "ProblemsTestTVC.h"

@interface ProblemsTestTVC ()<SDCycleScrollViewDelegate>

@end

@implementation ProblemsTestTVC

static NSString *const classOneCellId = @"ClassOneID";




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.navigationController.navigationBar.translucent = NO;
    
    //注册自定义cell
    [self.tableView registerNib:[UINib nibWithNibName:@"ClassOneCell" bundle:nil]forCellReuseIdentifier:classOneCellId];
    
    //加载轮播图
    [self loadSDCycleImage];
    
    //cell根据内容自适应高度
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    
    
    
}

//加载轮播图
- (void)loadSDCycleImage
{
    CGFloat offset = 120; //设置偏移量和轮播图的高度相等
    //将tableView向下偏移轮播图高度的距离
    self.tableView.contentInset = UIEdgeInsetsMake(offset, 0, 0, 0);
    
    NSURL *url=[NSURL URLWithString:@"http://img1.gtimg.com/cq/pics/hv1/97/246/1244/80953927.jpg"];
    //2.创建请求对象
    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:url];
    //3.链接，下载
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //4.获取图片
    UIImage *image1=[UIImage imageWithData:data];
    
    NSURL *url1=[NSURL URLWithString:@"http://img1.gtimg.com/cq/pics/hv1/71/246/1244/80953901.jpg"];
    //2.创建请求对象
    NSURLRequest *request1=[[NSURLRequest alloc]initWithURL:url1];
    //3.链接，下载
    NSData *data1=[NSURLConnection sendSynchronousRequest:request1 returningResponse:nil error:nil];
    //4.获取图片
    UIImage *image2=[UIImage imageWithData:data1];
    
    NSURL *url2=[NSURL URLWithString:@"http://img1.gtimg.com/cq/pics/hv1/74/246/1244/80953904.jpg"];
    //2.创建请求对象
    NSURLRequest *request2=[[NSURLRequest alloc]initWithURL:url2];
    //3.链接，下载
    NSData *data2=[NSURLConnection sendSynchronousRequest:request2 returningResponse:nil error:nil];
    //4.获取图片
    UIImage *image3=[UIImage imageWithData:data2];
    
    NSURL *url3=[NSURL URLWithString:@"http://img1.gtimg.com/cq/pics/hv1/79/246/1244/80953909.jpg"];
    //2.创建请求对象
    NSURLRequest *request3=[[NSURLRequest alloc]initWithURL:url3];
    //3.链接，下载
    NSData *data3=[NSURLConnection sendSynchronousRequest:request3 returningResponse:nil error:nil];
    //4.获取图片
    UIImage *image4=[UIImage imageWithData:data3];
    
    NSURL *url4=[NSURL URLWithString:@"http://img1.gtimg.com/cq/pics/hv1/84/246/1244/80953914.jpg"];
    //2.创建请求对象
    NSURLRequest *request4=[[NSURLRequest alloc]initWithURL:url3];
    //3.链接，下载
    NSData *data4=[NSURLConnection sendSynchronousRequest:request4 returningResponse:nil error:nil];
    //4.获取图片
    UIImage *image5=[UIImage imageWithData:data4];
    
    
    NSArray *images = @[image1,
                        image2,
                        image3,
                        image4,
                        image5];
  
    //第三方视图
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, -offset, kScreenWidth, offset) imagesGroup:images];

    
    
    cycleScrollView.infiniteLoop = YES;
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    cycleScrollView.contentMode = UIViewContentModeScaleAspectFill;
    //添加到tableView上
    [self.tableView addSubview:cycleScrollView];
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
    ClassOneCell *cell = [tableView dequeueReusableCellWithIdentifier:classOneCellId forIndexPath:indexPath];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    if (indexPath.row == 1) {
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

- (void)loadAction:(ClassOneCell *)sender
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
    orderVC.weburl = c1orderUrl;
    orderVC.title = @"顺序练习";
    [self.navigationController pushViewController:orderVC animated:YES]; 
}

//随机测试按钮
- (void)suiJiTestAction
{
    ViewController *orderVC = [ViewController new];
    orderVC.weburl = c1randUrl;
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
    testMethod.url = k1testmethod;
    [testMethod setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:testMethod animated:YES];
}

//评论按钮
- (void)commentAction
{
    NSLog(@"评论按钮");
}


#pragma mark 轮播图协议方法
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"你点击了第%ld张图片", index);
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

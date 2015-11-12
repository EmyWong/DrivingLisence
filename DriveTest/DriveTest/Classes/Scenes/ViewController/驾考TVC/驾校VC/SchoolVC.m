//
//  SchoolVC.m
//  DriveTest
//
//  Created by lanou3g on 15/11/11.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "SchoolVC.h"

@interface SchoolVC ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
//声明一个数组，用来接收数据
@property (nonatomic,strong)NSMutableArray * allDataArray;

@end

@implementation SchoolVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leaftAction)];
    
    //注册tableView
    [self.myTableView registerNib:[UINib nibWithNibName:@"SchoolInfoCell" bundle:nil] forCellReuseIdentifier:@"schoolCell"];
    
    //设置代理数据源
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    //加载数据
    [self loadData];
    
    
    //cell自适应高度
    self.myTableView.rowHeight = UITableViewAutomaticDimension;
    self.myTableView.estimatedRowHeight = 100;
    
}

- (void)loadData {
    self.allDataArray = [NSMutableArray array];
    [[AnalyticalData sharedIntance]clickLoadDataWithInfoid:self.string type:self.type option:^(NSArray *array) {
        [self.allDataArray addObjectsFromArray:array];
        [self.myTableView reloadData];
    }];
    
}



- (void)leaftAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark UITableViewDelegate And UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.allDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SchoolInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"schoolCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //加载cell上buuton的点击事件
    [self loadAction:cell];
    
    
    ClickJxInfo * info = self.allDataArray[indexPath.row];
    cell.clickJxInfo = info;
    return cell;
}

#pragma mark 加载cell上Button的点击事件
- (void)loadAction:(SchoolInfoCell *)sender
{
    //电话
    [sender.phoneNumber addTarget:self action:@selector(phoneNumberAction) forControlEvents:UIControlEventTouchUpInside];
    //路线
    [sender.luXianButton addTarget:self action:@selector(luXianButtonAction) forControlEvents:UIControlEventTouchUpInside];
    //简介
    [sender.genduou addTarget:self action:@selector(jianJieButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    //跟多简介
    [sender.jianJieButton addTarget:self action:@selector(jianJieButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    //驾校特色
    [sender.teSeButton addTarget:self action:@selector(teSeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    //驾校新闻
    [sender.xinWenButton addTarget:self action:@selector(xinWenButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    //驾友讨论
    [sender.taoLunButton addTarget:self action:@selector(taoLunButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    //学员点评
    [sender.dianPingButton addTarget:self action:@selector(dianPingButtonAction) forControlEvents:UIControlEventTouchUpInside];
}

//电话
- (void)phoneNumberAction
{
    NSLog(@"电话");
}

//路线
- (void)luXianButtonAction
{
    NSString *routeStr = [NSString stringWithFormat:@"http://api.jxedt.com/detail/%@/bus/?format=json&type=%@",self.string,self.type];
    DrivingLisenceVC *testMethod = [DrivingLisenceVC new];
    testMethod.url = routeStr;
    testMethod.title = @"班车路线";
    [testMethod setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:testMethod animated:YES];
}

//简介
- (void)jianJieButtonAction
{
    NSString *routeStr = [NSString stringWithFormat:@"http://api.jxedt.com/detail/%@/summary/?format=json&type=%@",self.string,self.type];
    DrivingLisenceVC *testMethod = [DrivingLisenceVC new];
    testMethod.url = routeStr;
    testMethod.title = @"驾校简介";
    [testMethod setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:testMethod animated:YES];
}

//驾校特色
- (void)teSeButtonAction
{
    NSString *routeStr = [NSString stringWithFormat:@"http://api.jxedt.com/detail/%@/feature/?format=json&type=%@",self.string,self.type];
    DrivingLisenceVC *testMethod = [DrivingLisenceVC new];
    testMethod.url = routeStr;
    testMethod.title = @"驾校特色";
    [testMethod setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:testMethod animated:YES];
}

//驾校新闻
- (void)xinWenButtonAction
{
    NSString *routeStr = [NSString stringWithFormat:@"http://api.jxedt.com/detail/%@/news/list/?format=json&type=%@",self.string,self.type];
    DrivingLisenceVC *testMethod = [DrivingLisenceVC new];
    testMethod.url = routeStr;
    testMethod.title = @"驾校新闻";
    [testMethod setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:testMethod animated:YES];
}

//驾友讨论
- (void)taoLunButtonAction
{
    NSLog(@"讨论");
}

//驾友点评
- (void)dianPingButtonAction
{
    NSLog(@"点评");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

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
    
    self.title = @"驾校详情";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leaftAction)];
    
    //注册tableView
    [self.myTableView registerNib:[UINib nibWithNibName:@"SchoolInfoCell" bundle:nil] forCellReuseIdentifier:@"schoolCell"];
    
    
    self.myTableView.tableFooterView = [[UIView alloc] init];
    
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
    [sender.dianPingButton addTarget:self action:@selector(dianPingButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}

//电话
- (void)phoneNumberAction
{
    NSLog(@"电话");
    
    ClickJxInfo *clickJxInfo = self.allDataArray[0];
    
    Baseinfoarea * base = [Baseinfoarea new];
    [base setValuesForKeysWithDictionary:clickJxInfo.baseinfoarea];
    
    NSMutableArray *resArr = [[NSMutableArray alloc] initWithCapacity:1];
    NSArray *arr = base.tel;
    //转id类型数据
    for (id obj in arr) {
        NSString *str = [NSString stringWithFormat:@"%@", obj];
        [resArr addObject:str];
    }

    UIAlertController *alertController = nil;
    
    alertController = [UIAlertController alertControllerWithTitle:@"选择号码" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    NSMutableArray *phoneArr = [NSMutableArray new];
    
    for (int i = 0; i < resArr.count; i ++) {
        
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:resArr[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSString *callString = resArr[i];
            
            NSString *URLString = [@"tel://" stringByAppendingString:callString];
            
            NSURL *URL = [NSURL URLWithString:URLString];
            
            [[UIApplication sharedApplication] openURL:URL];
            
        }];
        
        [phoneArr addObject:action1];
        
    }
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    for (id obj in phoneArr) {
        [alertController addAction:obj];
    }
    
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];

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
    ClickJxInfo * info = self.allDataArray[0];
    Bbsgrouparea * bbsgrouparea = [Bbsgrouparea new];
    [bbsgrouparea setValuesForKeysWithDictionary:info.bbsgrouparea];
    
    NSString * infoid = [NSString stringWithFormat:@"%@",bbsgrouparea.groupaction[@"extparam"][@"infoid"]];
    
    
    TaoLunTVC * VC = [TaoLunTVC new];
    UINavigationController *NC = [[UINavigationController alloc] initWithRootViewController:VC];
    VC.infoid = infoid;
    VC.articletip = bbsgrouparea.articletip;
    VC.title = bbsgrouparea.title;
    [self presentViewController:NC animated:YES completion:nil];
}

//驾友点评
- (void)dianPingButtonAction:(UIButton *)sender
{
    
    SchoolInfoCell *cell = (SchoolInfoCell *)[[[[[sender superview] superview] superview] superview] superview];
    
    NSIndexPath *indexPath = [self.myTableView indexPathForCell:cell];
    ClickJxInfo *click = self.allDataArray[indexPath.row];
    
    //学员点评：commentarea 字典
    Commentarea * commentarea = [Commentarea new];
    [commentarea setValuesForKeysWithDictionary:click.commentarea];
    NSString *comment = commentarea.moretext;
    NSString *str = [comment substringFromIndex:4];
    NSArray *arr = [str componentsSeparatedByString:@"条"];
    NSString *str1 = nil;
    if (arr.count != 0) {
        str1 = arr.firstObject;
        NSLog(@"%@", str1);
    }else{
        str1 = @"0";
    }
    
    
    
    XueYuanDPTVC * VC = [XueYuanDPTVC new];
    UINavigationController *NC = [[UINavigationController alloc] initWithRootViewController:VC];
    VC.infoid = self.string;
    VC.type = self.type;
    VC.num = [str1 intValue];
    [self presentViewController:NC animated:YES completion:nil];
    
    
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

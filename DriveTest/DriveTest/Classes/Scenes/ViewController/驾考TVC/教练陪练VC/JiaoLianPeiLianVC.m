//
//  JiaoLianPeiLianVC.m
//  DriveTest
//
//  Created by lanou3g on 15/11/11.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "JiaoLianPeiLianVC.h"

@interface JiaoLianPeiLianVC ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableVIew;

//声明一个数组，用来接收数据
@property (nonatomic,strong)NSMutableArray * allDataArray;


@end

@implementation JiaoLianPeiLianVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self.type isEqualToString:@"jl"]) {
        self.title = @"教练详情";
    }else {
        self.title = @"陪练详情";
    }
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leaftAction)];
    
    //注册tableView
    [self.myTableVIew registerNib:[UINib nibWithNibName:@"JLPLCell" bundle:nil] forCellReuseIdentifier:@"JLCell"];
    
    
    self.myTableVIew.tableFooterView = [[UIView alloc] init];
    
    //设置代理数据源
    self.myTableVIew.delegate = self;
    self.myTableVIew.dataSource = self;
    
    //cell自适应高度
    self.myTableVIew.rowHeight = UITableViewAutomaticDimension;
    self.myTableVIew.estimatedRowHeight = 100;
    
    //加载数据
    [self loadData];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)loadData {
    self.allDataArray = [NSMutableArray array];
    [[AnalyticalData sharedIntance]clickLoadDataWithInfoid:self.string type:self.type option:^(NSArray *array) {
        [self.allDataArray addObjectsFromArray:array];
        [self.myTableVIew reloadData];
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
    JLPLCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JLCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //cell上的Button点击事件
    [self loadAction:cell];
    
    
    ClickJxInfo * info = self.allDataArray[indexPath.row];
    cell.clickJxInfo = info;
    return cell;
}

#pragma mark cell点击事件

- (void)loadAction:(JLPLCell *)sender
{
    //电话
    [sender.phoneNumber addTarget:self action:@selector(phoneNumberAction) forControlEvents:UIControlEventTouchUpInside];
    //跟多简介
    [sender.jianJie addTarget:self action:@selector(jianJieButtonAction) forControlEvents:UIControlEventTouchUpInside];
    //学员点评
    [sender.dianPing addTarget:self action:@selector(dianPingButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
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
- (void)jianJieButtonAction
{
    NSString *routeStr = [NSString stringWithFormat:@"http://api.jxedt.com/detail/%@/summary/?format=json&type=%@",self.string,self.type];
    DrivingLisenceVC *testMethod = [DrivingLisenceVC new];
    testMethod.url = routeStr;
    testMethod.title = @"教练简介";
    [testMethod setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:testMethod animated:YES];
}


//学员点评跳转
- (void)dianPingButtonAction:(UIButton *)sender
{
    
    JLPLCell *cell = (JLPLCell *)[[[[sender superview] superview] superview] superview];
    
    
    
    NSIndexPath *indexPath = [self.myTableVIew indexPathForCell:cell];
    ClickJxInfo *click = self.allDataArray[indexPath.row];
    
    //学员点评：commentarea 字典
    Commentarea * commentarea = [Commentarea new];
    [commentarea setValuesForKeysWithDictionary:click.commentarea];
    NSString *comment = commentarea.moretext;
    NSString *str = [comment substringFromIndex:4];
    NSString *str1 = [str substringToIndex:2];
    
    
    
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

//
//  DriveSchoolVC.m
//  DriveTest
//
//  Created by lanou3g on 15/11/10.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "DriveSchoolVC.h"
#import "FileService.h"
#import "SettingTableViewController.h"

@interface DriveSchoolVC ()<UITableViewDataSource,UITableViewDelegate,RNFrostedSidebarDelegate,UIAlertViewDelegate>
//声明方法
- (IBAction)firstSegmentedControlAction:(UISegmentedControl *)sender;
- (IBAction)secondSegmentedControlAction:(UISegmentedControl *)sender;
//声明属性
//tableView
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//声明一个str属性，用来接收驾校排序方式
@property (nonatomic,strong)NSString * str;
//声明一个type属性，用来接收@"jx" @"jl" @"pl";
@property (nonatomic,strong)NSString * type;
//声明一个数组，用来接收数据
@property (nonatomic,strong)NSMutableArray * allDataArray;
//声明一个pageindex，用于刷新数据
@property (nonatomic,assign)NSInteger pageindex;

@property (nonatomic,strong) RNFrostedSidebar *callout;


@end

@implementation DriveSchoolVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //给type设置初始值
    self.type = @"jx";
    //给tableView设置代理
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"DriveSchoolCell" bundle:nil] forCellReuseIdentifier:@"driveSchoolCellID"];
    //实现加载数据的方法
    [self loadData];
    
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    //shang拉刷新
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        //刷新数据
        _pageindex ++;
        [[AnalyticalData sharedIntance]searchInfolistDataWithStr:_str type:_type pageindex:[NSString stringWithFormat:@"%ld",_pageindex] cityid:@"1" option:^(NSArray *array) {
            //接收数据
            [self.allDataArray addObjectsFromArray:array];
            //刷新表视图
            [self.tableView reloadData];
        }];
        [self.tableView.mj_footer endRefreshing];
    }];
    
    
    //金科的抽屉
    UIImage *image = [UIImage imageNamed:@"touxiang1"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(menuAction)];
    
       
}

//加载数据
- (void)loadData {
    //给予pageindex初始值为1
    self.pageindex = 1;
    //初始化数组
    self.allDataArray = [NSMutableArray array];
    //调用封装好的方法
    [[AnalyticalData sharedIntance]searchInfolistDataWithStr:_str type:_type pageindex:[NSString stringWithFormat:@"%ld",_pageindex] cityid:@"1" option:^(NSArray *array) {
        //接收数据
        [self.allDataArray addObjectsFromArray:array];
        //刷新表视图
        [self.tableView reloadData];
    }];
}



//返回row的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _allDataArray.count;
}


//每个cell上显示的内容
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DriveSchoolCell * cell = [tableView dequeueReusableCellWithIdentifier:@"driveSchoolCellID" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    Infolist * info = _allDataArray[indexPath.row];
    cell.info = info;
    //加载cell上buuton的点击事件
    [self loadAction:cell];
    return cell;
}

#pragma mark 加载cell上Button的点击事件
- (void)loadAction:(DriveSchoolCell*)sender {
    [sender.selectButton addTarget:self action:@selector(selectButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}

//点击进入下一页的方法
- (void)selectButtonAction:(UIButton*)sender {
    
    DriveSchoolCell *cell = (DriveSchoolCell *)[[sender superview] superview];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    
    //如果是驾校cell，跳转进入驾校详情
    if ([self.type isEqualToString:@"jx"]) {
        //张飞****跳转进驾校详情页面
        SchoolVC *VC = [SchoolVC new];
        UINavigationController *NC = [[UINavigationController alloc] initWithRootViewController:VC];
        Infolist * info = _allDataArray[indexPath.row];
        VC.type = self.type;
        
        VC.string = [NSString stringWithFormat:@"%@",info.infoid];
        
        [self presentViewController:NC animated:YES completion:nil];
    }else{
        JiaoLianPeiLianVC *VC = [JiaoLianPeiLianVC new];
        UINavigationController *NC = [[UINavigationController alloc] initWithRootViewController:VC];
        Infolist * info = _allDataArray[indexPath.row];
        VC.type = self.type;
        VC.string = [NSString stringWithFormat:@"%@",info.infoid];
        [self presentViewController:NC animated:YES completion:nil];
    }
    
}


//返回row的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}



//SegmentedControl(驾校，教练，陪练)的点击实现方法
- (IBAction)firstSegmentedControlAction:(UISegmentedControl *)sender {
    // 获取当前的选中项的索引值
    NSInteger index = sender.selectedSegmentIndex;
    // 判断索引值
    switch (index) {
        case 0:
            _type = @"jx";
            break;
        case 1:
            _type = @"jl";
            break;
        case 2:
            _type = @"pl";
            break;
        default:
            break;
    }
    [self loadData];
}

//SegmentedControl(口碑，人气，价格)的点击实现方法
- (IBAction)secondSegmentedControlAction:(UISegmentedControl *)sender {
    // 获取当前的选中项的索引值
    NSInteger index = sender.selectedSegmentIndex;
    // 判断索引值
    switch (index) {
        case 0:
            _str = nil;
            break;
        case 1:
            _str = @"koubei";
            break;
        case 2:
            _str = @"renqi";
            break;
        case 3:
            _str = @"price";
            break;
        default:
            break;
    }
    [self loadData];
}





- (void) menuAction
{
    NSArray *images = @[
                        [UIImage imageNamed:@"f19"],
                        [UIImage imageNamed:@"kemu2@2x"],
                        [UIImage imageNamed:@"kemusan@2x"],
                        [UIImage imageNamed:@"remenpp@2x"],
                        [UIImage imageNamed:@"setting@2x"]
                        ];
    
    self.callout = [[RNFrostedSidebar alloc] initWithImages:images];
    
    self.callout.delegate = self;
    [_callout show];
}

#pragma mark - 菜单栏点击事件
- (void)sidebar:(RNFrostedSidebar *)sidebar didTapItemAtIndex:(NSUInteger)index
{
    switch (index) {
        case 0:
        {
            LoginViewController *loginVC = [LoginViewController new];
            [loginVC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:loginVC animated:YES];
            [self.callout dismiss];

        }
            break;
        case 1:
        {
            DrivingLisenceVC *testMethod = [DrivingLisenceVC new];
            testMethod.url = @"http://bbs.api.jxedt.com/news/h5/201/index";
            testMethod.title = @"新手须知";
            [testMethod setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:testMethod animated:YES];
            [self.callout dismiss];
            
        }
            break;
        case 2:
        {
            DrivingLisenceVC *testMethod = [DrivingLisenceVC new];
            testMethod.url = @"http://bbs.api.jxedt.com/news/h5/208/index";
            testMethod.title = @"学车指南";
            [testMethod setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:testMethod animated:YES];
            [self.callout dismiss];
            
        }
            break;
        case 3:
        {
            DrivingLisenceVC *testMethod = [DrivingLisenceVC new];
            testMethod.url = @"http://bbs.api.jxedt.com/news/h5/101/index";
            testMethod.title = @"驾考头条";
            [testMethod setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:testMethod animated:YES];
            [self.callout dismiss];
        }
            break;
        case 4:
        {
            [self.callout dismiss];
            [self.navigationController pushViewController:[SettingTableViewController new] animated:YES];
        }
            break;
            
        default:
            break;
    }
}


@end

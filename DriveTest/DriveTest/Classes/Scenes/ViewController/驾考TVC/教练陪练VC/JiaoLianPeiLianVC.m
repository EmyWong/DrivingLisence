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
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leaftAction)];
    
    //注册tableView
    [self.myTableVIew registerNib:[UINib nibWithNibName:@"JLPLCell" bundle:nil] forCellReuseIdentifier:@"JLCell"];
    
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
    ClickJxInfo * info = self.allDataArray[indexPath.row];
    cell.clickJxInfo = info;
    return cell;
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

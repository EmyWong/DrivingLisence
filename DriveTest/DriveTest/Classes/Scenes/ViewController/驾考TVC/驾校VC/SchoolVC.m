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

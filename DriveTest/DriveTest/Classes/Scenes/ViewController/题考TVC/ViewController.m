//
//  ViewController.m
//  kaoshi
//
//  Created by 王颜华 on 15/11/9.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,assign) NSInteger number;
@property (nonatomic,strong) TestResult *test;

@property (nonatomic,strong) QuestionCell *cell;
@property (nonatomic,strong) PanduanCell *cell1;
@property (nonatomic,strong) ImageQuestionCell *cell2;
@property (nonatomic,strong) ImagePDCell *cell3;
@end

@implementation ViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"错题集" style:(UIBarButtonItemStylePlain) target:self action:@selector(submitAction:)];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(popAction:)];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.number = 0;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 200;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"PanduanCell" bundle:nil] forCellReuseIdentifier:@"panduancell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"QuestionCell" bundle:nil] forCellReuseIdentifier:@"qcell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ImageQuestionCell" bundle:nil] forCellReuseIdentifier:@"imagecell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ImagePDCell" bundle:nil] forCellReuseIdentifier:@"imagepdcell"];
    
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleGray)];
    activityView.frame = CGRectMake(0, 0, 30, 30);
    activityView.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2 -66);
    [self.view addSubview:activityView];
    
    //测试是否有网络连接
    if ([[NetWorkManager sharedWithManager] isConnectionAvailable]== NO) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"无网络连接" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else
    {
    [activityView startAnimating];
    [[TestHelper sharedHelper]loadData:^{
        [activityView stopAnimating];
        [self.view addSubview:self.tableView];
        [self.tableView reloadData];
    } webURL:self.weburl];
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (indexPath.row == 0) {
      
   self.test = [[TestHelper sharedHelper]modelAtIndex:self.number];
    if ([_test.item3 isEqualToString:@""]) {
        
        if (![self.test.url isEqualToString:@""]) {
            self.cell3= [tableView dequeueReusableCellWithIdentifier:@"imagepdcell" forIndexPath:indexPath];
            
            _cell3.selectionStyle = UITableViewCellSelectionStyleNone;
            _cell3.test = _test;
            _cell3.questionLabel.text = [NSString stringWithFormat:@"%ld.%@",self.number+1,self.test.question];
            [_cell3.lastOne addTarget:self action:@selector(lastOneAction:) forControlEvents:(UIControlEventTouchUpInside)];
            [_cell3.nextOne addTarget:self action:@selector(nextOneAction:) forControlEvents:(UIControlEventTouchUpInside)];
            [_cell3.Save addTarget:self action:@selector(saveAction:) forControlEvents:(UIControlEventTouchUpInside)];
            
            return _cell3;

        }
        
        else
        {
        self.cell1 = [tableView dequeueReusableCellWithIdentifier:@"panduancell" forIndexPath:indexPath];
        
        _cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        _cell1.test = _test;
        _cell1.questionLabel.text = [NSString stringWithFormat:@"%ld.%@",self.number+1,self.test.question];
        [_cell1.lastOne addTarget:self action:@selector(lastOneAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_cell1.nextOne addTarget:self action:@selector(nextOneAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_cell1.Save addTarget:self action:@selector(saveAction:) forControlEvents:(UIControlEventTouchUpInside)];
        
        return _cell1;
        }
    }
    else
    {
        if (![self.test.url isEqualToString:@""]) {
            self.cell2 = [tableView dequeueReusableCellWithIdentifier:@"imagecell" forIndexPath:indexPath];
            _cell2.selectionStyle = UITableViewCellSelectionStyleNone;
            _cell2.test = _test;
            _cell2.questionLabel.text = [NSString stringWithFormat:@"%ld.%@",self.number+1,self.test.question];
            [_cell2.lastOne addTarget:self action:@selector(lastOneAction:) forControlEvents:(UIControlEventTouchUpInside)];
            [_cell2.nextOne addTarget:self action:@selector(nextOneAction:) forControlEvents:(UIControlEventTouchUpInside)];
            [_cell2.Save addTarget:self action:@selector(saveAction:) forControlEvents:(UIControlEventTouchUpInside)];
            return _cell2;
        }
        
        else
        {
        self.cell = [tableView dequeueReusableCellWithIdentifier:@"qcell" forIndexPath:indexPath];
       
        _cell.selectionStyle = UITableViewCellSelectionStyleNone;
        _cell.test = _test;
        _cell.questionLabel.text = [NSString stringWithFormat:@"%ld.%@",self.number+1,self.test.question];
        [_cell.lastOne addTarget:self action:@selector(lastOneAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_cell.nextOne addTarget:self action:@selector(nextOneAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_cell.Save addTarget:self action:@selector(saveAction:) forControlEvents:(UIControlEventTouchUpInside)];
        
        return _cell;
    }
    }
  }
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}
- (void)lastOneAction:(UIButton *)sender
{
    if (self.number == 0) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"已经是第一个了" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else
    {
        self.number -= 1;
        [self.tableView reloadData];
    }
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:(UITableViewScrollPositionTop) animated:YES];
}
- (void)nextOneAction:(UIButton *)sender
{
    if (self.number == [TestHelper sharedHelper].numberOfData -1) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"已经是最后一题了" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else
    {
        self.number += 1;
        [self.tableView reloadData];
    }
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:(UITableViewScrollPositionTop) animated:YES];
}
- (void)saveAction:(UIButton *)sender
{
    
    if ([TestHelper sharedHelper].CuoTiArr.count == 0)
    {
        [[TestHelper sharedHelper]addCuoti:self.test];
        TimerDisappearAlertView *alert = [[TimerDisappearAlertView alloc]initWithTitle:@"加入错题集成功！"];
        [alert show];
    }
    else
    {
        BOOL flag = NO;
    for (TestResult *test in [TestHelper sharedHelper].CuoTiArr) {
        if ([self.test isEqual:test]) {
            flag = YES;
            TimerDisappearAlertView *alert = [[TimerDisappearAlertView alloc]initWithTitle:@"该题已存在！"];
            [alert show];
        }
    }
        if (flag == NO) {
           [[TestHelper sharedHelper]addCuoti:self.test];
            TimerDisappearAlertView *alert = [[TimerDisappearAlertView alloc]initWithTitle:@"加入错题集成功！"];
            [alert show];
        }
    }

}

//错题集按钮
- (void)submitAction:(UIBarButtonItem *)sender
{
    
    CuoTiViewController *cuotiVC = [CuoTiViewController new];
    [self.navigationController pushViewController:cuotiVC animated:YES];

}
- (void)popAction:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

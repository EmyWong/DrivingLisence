//
//  CuoTiViewController.m
//  kaoshi
//
//  Created by 王颜华 on 15/11/10.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "CuoTiViewController.h"

@interface CuoTiViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,assign) NSInteger number;
@property (nonatomic,strong) TestResult *test;

@property (nonatomic,strong) QuestionCell *cell;
@property (nonatomic,strong) PanduanCell *cell1;
@property (nonatomic,strong) ImageQuestionCell *cell2;
@property (nonatomic,strong) ImagePDCell *cell3;
@end

@implementation CuoTiViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"错题集";
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 200;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"QuestionCell" bundle:nil] forCellReuseIdentifier:@"qcell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"PanduanCell" bundle:nil] forCellReuseIdentifier:@"panduancell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ImageQuestionCell" bundle:nil] forCellReuseIdentifier:@"imagecell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ImagePDCell" bundle:nil] forCellReuseIdentifier:@"imagepdcell"];
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
    
    if ([TestHelper sharedHelper].CuoTiArr.count == 0) {
         UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        if (indexPath.row == 0)
        {
        cell.textLabel.text = @"当前没有错题哦^_^";
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else
    {
        if (indexPath.row == 0) {
        self.test = [TestHelper sharedHelper].CuoTiArr[self.number];
        if ([_test.item3 isEqualToString:@""]) {
            if (![self.test.url isEqualToString:@""]) {
                self.cell3 = [tableView dequeueReusableCellWithIdentifier:@"imagepdcell" forIndexPath:indexPath];
                
                _cell3.selectionStyle = UITableViewCellSelectionStyleNone;
                _cell3.test = _test;
                _cell3.questionLabel.text = [NSString stringWithFormat:@"%ld.%@",self.number+1,self.test.question];
                [_cell3.lastOne addTarget:self action:@selector(lastOneAction:) forControlEvents:(UIControlEventTouchUpInside)];
                [_cell3.nextOne addTarget:self action:@selector(nextOneAction:) forControlEvents:(UIControlEventTouchUpInside)];
                [_cell3.Save setTitle:@"解释" forState:(UIControlStateNormal)];
                [_cell3.Save addTarget:self action:@selector(explainAction:) forControlEvents:(UIControlEventTouchUpInside)];
                
                //判断状态
                if ([self.test.checkStr isEqualToString:@"1"]) {
                    [_cell3.item1Btn setImage:[UIImage imageNamed:@"cuoti"] forState:(UIControlStateNormal)];
                }
                else
                {
                    [_cell3.item2Btn setImage:[UIImage imageNamed:@"cuoti"] forState:(UIControlStateNormal)];
                }
                //判断正确答案
                if ([self.test.answer isEqualToString:@"1"]) {
                    [_cell3.item1Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
                }
                else
                {
                    [_cell3.item2Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
                }
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
            [_cell1.Save setTitle:@"解释" forState:(UIControlStateNormal)];
            [_cell1.Save addTarget:self action:@selector(explainAction:) forControlEvents:(UIControlEventTouchUpInside)];
            
            //判断状态
            if ([self.test.checkStr isEqualToString:@"1"]) {
                [_cell1.item1Btn setImage:[UIImage imageNamed:@"cuoti"] forState:(UIControlStateNormal)];
            }
            else
            {
                [_cell1.item2Btn setImage:[UIImage imageNamed:@"cuoti"] forState:(UIControlStateNormal)];
            }
            //判断正确答案
            if ([self.test.answer isEqualToString:@"1"]) {
                [_cell1.item1Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            }
            else
            {
                [_cell1.item2Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            }
            return _cell1;
            }
        }
        else
        {
            if (![self.test.url isEqualToString:@""]) {
                self.cell2
                = [tableView dequeueReusableCellWithIdentifier:@"imagecell" forIndexPath:indexPath];
                
                
                [_cell2.Save setTitle:@"解释" forState:(UIControlStateNormal)];
                
                _cell2.selectionStyle = UITableViewCellSelectionStyleNone;
                _cell2.test = _test;
                _cell2.questionLabel.text = [NSString stringWithFormat:@"%ld.%@",self.number+1,self.test.question];
                [_cell2.lastOne addTarget:self action:@selector(lastOneAction:) forControlEvents:(UIControlEventTouchUpInside)];
                [_cell2.nextOne addTarget:self action:@selector(nextOneAction:) forControlEvents:(UIControlEventTouchUpInside)];
                [_cell2.Save addTarget:self action:@selector(explainAction:) forControlEvents:(UIControlEventTouchUpInside)];
                
                //判断状态
                if ([self.test.checkStr isEqualToString:@"1"]) {
                    [_cell2.item1Btn setImage:[UIImage imageNamed:@"cuoti"] forState:(UIControlStateNormal)];
                }
                else if ([self.test.checkStr isEqualToString:@"2"])
                {
                    [_cell2.item2Btn setImage:[UIImage imageNamed:@"cuoti"] forState:(UIControlStateNormal)];
                }
                else if ([self.test.checkStr isEqualToString:@"3"])
                {
                    [_cell2.item3Btn setImage:[UIImage imageNamed:@"cuoti"] forState:(UIControlStateNormal)];
                }
                else
                {
                    [_cell2.item4Btn setImage:[UIImage imageNamed:@"cuoti"] forState:(UIControlStateNormal)];
                }
                
                
                //判断正确答案
                if ([self.test.answer isEqualToString:@"1"]) {
                    [_cell2.item1Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
                }
                else if ([self.test.answer isEqualToString:@"2"]) {
                    [_cell2.item2Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
                }
                else if ([self.test.answer isEqualToString:@"3"]) {
                    [_cell2.item3Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
                }
                else
                {
                    [_cell2.item4Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
                }
                
                return _cell2;
            }
            else
            {
            self.cell
            = [tableView dequeueReusableCellWithIdentifier:@"qcell" forIndexPath:indexPath];
            
            
            [_cell.Save setTitle:@"解释" forState:(UIControlStateNormal)];
            
            _cell.selectionStyle = UITableViewCellSelectionStyleNone;
            _cell.test = _test;
            _cell.questionLabel.text = [NSString stringWithFormat:@"%ld.%@",self.number+1,self.test.question];
            [_cell.lastOne addTarget:self action:@selector(lastOneAction:) forControlEvents:(UIControlEventTouchUpInside)];
            [_cell.nextOne addTarget:self action:@selector(nextOneAction:) forControlEvents:(UIControlEventTouchUpInside)];
            [_cell.Save addTarget:self action:@selector(explainAction:) forControlEvents:(UIControlEventTouchUpInside)];
            
            //判断状态
            if ([self.test.checkStr isEqualToString:@"1"]) {
                [_cell.item1Btn setImage:[UIImage imageNamed:@"cuoti"] forState:(UIControlStateNormal)];
            }
            else if ([self.test.checkStr isEqualToString:@"2"])
            {
                [_cell.item2Btn setImage:[UIImage imageNamed:@"cuoti"] forState:(UIControlStateNormal)];
            }
            else if ([self.test.checkStr isEqualToString:@"3"])
            {
                [_cell.item3Btn setImage:[UIImage imageNamed:@"cuoti"] forState:(UIControlStateNormal)];
            }
            else
            {
                [_cell.item4Btn setImage:[UIImage imageNamed:@"cuoti"] forState:(UIControlStateNormal)];
            }
            
            
            //判断正确答案
            if ([self.test.answer isEqualToString:@"1"]) {
                [_cell.item1Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            }
            else if ([self.test.answer isEqualToString:@"2"]) {
                [_cell.item2Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            }
            else if ([self.test.answer isEqualToString:@"3"]) {
                [_cell.item3Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            }
            else
            {
                [_cell.item4Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            }
            
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
    if (self.number == [TestHelper sharedHelper].CuoTiArr.count -1) {
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

- (void)explainAction:(UIButton *)sender
{
    if ([_test.item3 isEqualToString:@""]) {
        
        if (![self.test.url isEqualToString:@""]) {
            _cell3.detailLabel.hidden = NO;
            _cell3.explainLabel.hidden = NO;
        }
        else
        {
            _cell1.detailLabel.hidden = NO;
            _cell1.explainLabel.hidden = NO;
        }
    }
    else
    {
        if (![self.test.url isEqualToString:@""]) {
            _cell2.detailLabel.hidden = NO;
            _cell2.explainLabel.hidden = NO;
        }
        else
        {
            _cell.detailLabel.hidden = NO;
            _cell.explainLabel.hidden = NO;
        }
    }
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

//
//  TaoLunTVC.m
//  DriveTest
//
//  Created by lanou3g on 15/11/12.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "TaoLunTVC.h"
#import "MaxViewController.h"
@interface TaoLunTVC ()
//声明一个pageindex，用于刷新数据
@property (nonatomic,assign)NSInteger pageindex;
//声明一个数组，用来接收数据
@property (nonatomic,strong)NSMutableArray * allDataArray;
@end

@implementation TaoLunTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnAction)];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"JiaYouTaoLunCell" bundle:nil] forCellReuseIdentifier:@"jiayoucell"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TaoLunCell" bundle:nil] forCellReuseIdentifier:@"tupiancell"];
    
    
    self.tableView.tableFooterView = [UIView new];
    
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    
    //给予pageindex初始值为1
    self.pageindex = 1;
    //初始化数组
    self.allDataArray = [NSMutableArray array];
    
    //加载数据
    [self loadData];
    
    //下拉刷新
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        //刷新数据
        _pageindex ++;
        if (_articletip == -1) {
            [self loadData];
            [self.tableView.mj_footer endRefreshing];
        }else if (_pageindex <= _articletip / 10 + 1) {
            [self loadData];
            [self.tableView.mj_footer endRefreshing];
        }else {
            [self.tableView.mj_footer noticeNoMoreData];
        }
    }];
}

- (void)loadData {
    
    [[AnalyticalData sharedIntance]driveDiscussionLoadDataWithInfoid:self.infoid pageindex:[NSString stringWithFormat:@"%ld",_pageindex] option:^(NSArray *array) {
        //接收数据
        [self.allDataArray addObjectsFromArray:array];
        //刷新表视图
        [self.tableView reloadData];
    }];
    
}


- (void)returnAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _allDataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     DriveDiscussion * drive = self.allDataArray[indexPath.row];
    
    if (nil == drive.imageurl) {
        JiaYouTaoLunCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jiayoucell" forIndexPath:indexPath];
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self loadAction:cell];
        
        cell.drive = drive;
        return cell;
        
    }else{
        
        TaoLunCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tupiancell" forIndexPath:indexPath];
        
        [self loadActionImg:cell];
        
        cell.drive = nil;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.drive = drive;
        
        //执行Block
        __weak typeof(self)temp = self;
        cell.transportBlock = ^()
        {
            MaxViewController  *VC = [MaxViewController new];
            VC.drive = drive;
            [temp presentViewController:VC animated:YES completion:nil];
        };
        return cell;
    }
    
}


#pragma mark 没图片的cell按钮监听事件
- (void)loadAction:(JiaYouTaoLunCell *)sender
{
    [sender.dianzanBnt setImage:[UIImage imageNamed:@"dianzan"] forState:UIControlStateNormal];
    [sender.dianzanBnt addTarget:self action:@selector(dianzanAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [sender.pinglunBut setImage:[UIImage imageNamed:@"ppp"] forState:UIControlStateNormal];
    
    [sender.pinglunBut addTarget:self action:@selector(pingLunAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)dianzanAction:(UIButton *)sender
{
    
    JiaYouTaoLunCell *cell = (JiaYouTaoLunCell *)[[[[sender superview] superview] superview] superview];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    DriveDiscussion *drive = self.allDataArray[indexPath.row];
    
    NSString *likeTip = drive.liketip;
    
    NSInteger num = [likeTip intValue];
    
    
    if ([sender.imageView.image isEqual:[UIImage imageNamed:@"dianzaned"]]) {
        
        cell.dianZan.text = likeTip;
        
        [sender setImage:[UIImage imageNamed:@"dianzan"] forState:UIControlStateNormal];
    }else{
        
        num = num + 1;
        NSString *str = [NSString stringWithFormat:@"%ld", num];
        
        cell.dianZan.text = str;
        
        
        [sender setImage:[UIImage imageNamed:@"dianzaned"] forState:UIControlStateNormal];
    }
    
    NSLog(@"wwwwww");
}

- (void)pingLunAction
{
    NSLog(@"ssssss");
}


#pragma mark 有图片的cell按钮监听事件
- (void)loadActionImg:(TaoLunCell *)sender
{
    [sender.dianzanBTN setImage:[UIImage imageNamed:@"dianzan"] forState:UIControlStateNormal];
    
    
    [sender.dianzanBTN addTarget:self action:@selector(DZAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [sender.pinglunBTN setImage:[UIImage imageNamed:@"ppp"] forState:UIControlStateNormal];
    
    [sender.pinglunBTN addTarget:self action:@selector(PLAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)DZAction:(UIButton *)sender
{
    
    TaoLunCell *cell = (TaoLunCell *)[[[[sender superview] superview] superview] superview];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    DriveDiscussion *drive = self.allDataArray[indexPath.row];
    
    NSString *likeTip = drive.liketip;
    
    NSInteger num = [likeTip intValue];
    
    
    
    if ([sender.imageView.image isEqual:[UIImage imageNamed:@"dianzaned"]]) {
        
        cell.dianzan.text = likeTip;
        
        [sender setImage:[UIImage imageNamed:@"dianzan"] forState:UIControlStateNormal];
    }else{
        
        num = num + 1;
        NSString *str = [NSString stringWithFormat:@"%ld", num];
        
        cell.dianzan.text = str;
        
        [sender setImage:[UIImage imageNamed:@"dianzaned"] forState:UIControlStateNormal];
    }
    NSLog(@"img dz");
}
- (void)PLAction
{
    
    
    NSLog(@"img pl");
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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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

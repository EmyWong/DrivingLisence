//
//  TaoLunTVC.m
//  DriveTest
//
//  Created by lanou3g on 15/11/12.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "TaoLunTVC.h"

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
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    //加载数据
    [self loadData];
    
    //下拉刷新
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        //刷新数据
        _pageindex ++;
        if (_pageindex <= _articletip % 10 +1) {
            [[AnalyticalData sharedIntance]driveDiscussionLoadDataWithInfoid:self.infoid pageindex:[NSString stringWithFormat:@"%ld",_pageindex] option:^(NSArray *array){
                //接收数据
                [self.allDataArray addObjectsFromArray:array];
                //刷新表视图
                [self.tableView reloadData];
                
            }];
             [self.tableView.mj_footer endRefreshing];
        }else {
        [self.tableView.mj_footer noticeNoMoreData];
        }
    }];

    
}

- (void)loadData {
    //给予pageindex初始值为1
    self.pageindex = 1;
    //初始化数组
    self.allDataArray = [NSMutableArray array];
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
        
        cell.drive = drive;
        return cell;
        
    }else{
        
        TaoLunCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tupiancell" forIndexPath:indexPath];
        
        cell.drive = nil;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.drive = drive;
        return cell;
    }
    
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

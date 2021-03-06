//
//  CommunityViewController.m
//  DriveTest
//
//  Created by jinke on 15/11/16.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "CommunityViewController.h"
#import "communityCell.h"
#import "communityTwoCell.h"
#import "SheQuVC.h"
#import "TieZi.h"
#import "MaxViewController.h"
#import "LoginViewController.h"

@interface CommunityViewController () <UITableViewDataSource,UITableViewDelegate>
{
    NSInteger _index;
}
@property (nonatomic,strong) UITableView *myTableView;

@property (nonatomic, strong) NSMutableArray *allTieZiArray;
@property (nonatomic, strong) UIAlertController *alert;

@end



@implementation CommunityViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.navigationController.title = @"驾考圈";
    
    
    self.navigationController.navigationBar.translucent = NO;
    
    [self addSubViews];
    
    [self.myTableView registerNib:[UINib nibWithNibName:@"TaoLunCell" bundle:nil] forCellReuseIdentifier:@"tupiancell"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"JiaYouTaoLunCell" bundle:nil] forCellReuseIdentifier:@"jiayoucell"];
    
    
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    self.myTableView.rowHeight = UITableViewAutomaticDimension;
    self.myTableView.estimatedRowHeight = 200;
    
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    
    //下拉刷新
    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        
        _index = 0;
        
        AVQuery *query = [TieZi query];
        [query includeKey:@"imgArr"];
        [query orderByDescending:@"createdAt"];
        query.limit = 10;
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            //
            if (!error) {
                
                [self.allTieZiArray removeAllObjects];
                
                for (TieZi *tie in objects) {
                    [self.allTieZiArray addObject:tie];
                }
                [self.myTableView reloadData];
                [self.myTableView.mj_header endRefreshing];
                _index = 1;
            }else{
                NSLog(@"网络出错");
                
                self.alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络不给力" preferredStyle:UIAlertControllerStyleAlert];

                
                [self presentViewController:self.alert animated:YES completion:nil];
                
                [self.myTableView.mj_header endRefreshing];
                
                
                sleep(1.0f);
                
                [self.alert dismissViewControllerAnimated:YES completion:nil];
                
                
            }
        }];
        
        
        
        
    }];

    
    

    
    
    self.myTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        //

        if (_index < 1) {
            _index = 0;
        }
        
        
        AVQuery *query = [TieZi query];
        [query includeKey:@"imgArr"];
        [query orderByDescending:@"createdAt"];
        query.limit = 10;
        
        query.skip = 10 * _index;
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            //
            if (!error) {
                for (TieZi *tie in objects) {
                    [self.allTieZiArray addObject:tie];
                }
                [self.myTableView reloadData];
                [self.myTableView.mj_footer endRefreshing];
                _index ++;
            }else{
                NSLog(@"网络出错");
                self.alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络不给力" preferredStyle:UIAlertControllerStyleAlert];
                
                
                [self presentViewController:self.alert animated:YES completion:nil];
                
                [self.myTableView.mj_footer endRefreshing];
                
                
                sleep(1.0f);
                
                [self.alert dismissViewControllerAnimated:YES completion:nil];
            }
        }];

        
    } ];
    
}

-(void) performDismiss:(NSTimer *)timer
{
    [self.alert dismissViewControllerAnimated:YES completion:nil];
}

- (void)xiaLaShuaXin
{
    
}





- (void) addSubViews
{

    self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:_myTableView];
    
    UIButton *talkButton = [UIButton buttonWithType:UIButtonTypeSystem];
    UIImage *image = [UIImage imageNamed:@"iconfont-jiahao"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [talkButton setImage:image forState:UIControlStateNormal];
    talkButton.frame = CGRectMake(kScreenWidth * 0.888,kScreenHight * 0.68, 32, 32);
    [talkButton addTarget:self action:@selector(editAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:talkButton];
    
    
    
    UIButton *freshButton = [UIButton buttonWithType:UIButtonTypeSystem];
    UIImage *image1 = [UIImage imageNamed:@"menu_icon"];
    image1 = [image1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [freshButton setImage:image1 forState:UIControlStateNormal];
    freshButton.frame = CGRectMake(kScreenWidth * 0.888,kScreenHight * 0.68 - 40, 32, 32);
    [freshButton addTarget:self action:@selector(freshAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:freshButton];
    
}



- (void) editAction
{
    NSLog(@"弹出编辑控制器");
    
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    if (app.loginType == YES) {
        UINavigationController *NC = [[UINavigationController alloc] initWithRootViewController:[SheQuVC new]];
        [self presentViewController:NC animated:YES completion:nil];
    }else
    {
        LoginViewController *loginVC = [LoginViewController new];
        [loginVC setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:loginVC animated:YES];
    }
    
}

- (void)freshAction
{
    
//    self.myTableView.contentOffset = CGPointMake(0, 0);
    
    
    [self.myTableView setContentOffset:CGPointMake(0, 0) animated:YES];
    
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return self.allTieZiArray.count;
    }else
    {
        return 3; //3个系统cell为了填充下面的bug
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        
        TieZi *tieZi = self.allTieZiArray[indexPath.row];
        NSLog(@"%@", tieZi.imgArr);
        if (tieZi.imgArr) {
            
            TaoLunCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tupiancell" forIndexPath:indexPath];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            TieZi *tiezi =
            
            cell.tiezi = tieZi;
            
            [self loadActionImg:cell];
            
            //执行Block
            __weak typeof(self)temp = self;
            cell.transportBlock = ^()
            {
                MaxViewController  *VC = [MaxViewController new];
                NSMutableArray *arr = [[NSMutableArray alloc] init];
                for (AVFile *obj in tiezi.imgArr) {
                    NSData *data = [obj getData];
                    NSLog(@"%@", data);
                    UIImage *image = [UIImage imageWithData:data];
                    [arr addObject:image];
                }
                
                VC.imageArr = arr;
                [temp presentViewController:VC animated:YES completion:nil];
            };
            return cell;
        }else{
            JiaYouTaoLunCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jiayoucell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            cell.tiezi = tieZi;
            
            [self loadAction:cell];
            
            return cell;
        }
    }else
    {
        return [[UITableViewCell alloc] init];
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
    NSLog(@"qqwqq");
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
       NSLog(@"img dz");
}
- (void)PLAction
{
    NSLog(@"img pl");
}










- (NSMutableArray *)allTieZiArray
{
    if (!_allTieZiArray) {
        self.allTieZiArray = [[NSMutableArray alloc] initWithCapacity:3];
    }
    return _allTieZiArray;
}


@end

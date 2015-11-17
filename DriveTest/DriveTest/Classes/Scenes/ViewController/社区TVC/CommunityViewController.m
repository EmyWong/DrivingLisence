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

@interface CommunityViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *myTableView;

@end

static NSString *const communityCellID = @"communityCell";
static NSString *const communityTwoCellID = @"communityTwoCell";

@implementation CommunityViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.translucent = NO;
    
    [self addSubViews];
    
    [self.myTableView registerNib:[UINib nibWithNibName:@"communityCell" bundle:nil] forCellReuseIdentifier:communityCellID];
    [self.myTableView registerNib:[UINib nibWithNibName:@"communityTwoCell" bundle:nil] forCellReuseIdentifier:communityTwoCellID];
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    self.myTableView.rowHeight = UITableViewAutomaticDimension;
    self.myTableView.estimatedRowHeight = 200;
    
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

}
- (void) addSubViews
{

    self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:_myTableView];
    
    UIButton *talkButton = [UIButton buttonWithType:UIButtonTypeSystem];
    UIImage *image = [UIImage imageNamed:@"iconfont-jiahao"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [talkButton setImage:image forState:UIControlStateNormal];
    talkButton.frame = CGRectMake(kScreenWidth * 0.888,kScreenHight * 0.75, 32, 32);
    [talkButton addTarget:self action:@selector(editAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:talkButton];
    
}
- (void) editAction
{
    NSLog(@"弹出编辑控制器");
    
    UINavigationController *NC = [[UINavigationController alloc] initWithRootViewController:[SheQuVC new]];
    [self presentViewController:NC animated:YES completion:nil];
    
}
#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 15;
    }else
    {
        return 3; //3个系统cell为了填充下面的bug
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        communityCell *cell = [tableView dequeueReusableCellWithIdentifier:communityCellID forIndexPath:indexPath];
        communityTwoCell *Tcell = [tableView dequeueReusableCellWithIdentifier:communityTwoCellID forIndexPath:indexPath];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        Tcell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (indexPath.row % 2 == 0) {
            return Tcell;
        }else
        {
            return cell;
        }

    }else
    {
        return [[UITableViewCell alloc] init];
    }
}




@end

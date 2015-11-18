//
//  ClassTwoThreeVC.m
//  DriveTest
//
//  Created by lanou3g on 15/11/10.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "ClassTwoThreeVC.h"

@interface ClassTwoThreeVC ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentButton;

//科目二三
@property (nonatomic, strong) RoadTestTVC *roadTwoTestTVC;
@property (nonatomic, strong) RoadTestThreeTVC *roadTestThreeTVC;

@end

@implementation ClassTwoThreeVC



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //找到MainStoryBoard中的科二科三的TVC控制器，添加为本试图控制器的子控制器
    self.roadTwoTestTVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"roadTwoID"];
    [self addChildViewController:self.roadTwoTestTVC];
    
    self.roadTestThreeTVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"roadThreeID"];
    [self addChildViewController:self.roadTestThreeTVC];
    
    
    
    [self.view addSubview:self.roadTwoTestTVC.view];
    
    self.segmentButton.selectedSegmentIndex = 0;
    [self.segmentButton addTarget:self action:@selector(segmentedControlAction:) forControlEvents:UIControlEventValueChanged];
    
    
    
    // Do any additional setup after loading the view.
}

//点击事件
- (void) segmentedControlAction:(UISegmentedControl *) sender
{
    [self.view.subviews.firstObject removeFromSuperview];
    UIViewController *insertVC = self.childViewControllers[sender.selectedSegmentIndex];
    [self.view addSubview:insertVC.view];
    self.tabBarController.tabBar.alpha = 1;
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

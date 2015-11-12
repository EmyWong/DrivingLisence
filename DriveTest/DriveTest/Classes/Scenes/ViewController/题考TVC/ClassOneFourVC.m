//
//  ClassOneFourVC.m
//  DriveTest
//
//  Created by lanou3g on 15/11/10.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "ClassOneFourVC.h"

@interface ClassOneFourVC ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *ClassOneOrFour;


//科目一科目四控制器
@property (nonatomic, strong) ProblemsTestTVC *problemsTestTVC;
@property (nonatomic, strong) ClassFourTestTVC *classFourTestTVC;

@end

@implementation ClassOneFourVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.problemsTestTVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"classOneID"];
    [self addChildViewController:self.problemsTestTVC];
    self.classFourTestTVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"classFourID"];
    [self addChildViewController:self.classFourTestTVC];

    
    [self.view addSubview:self.problemsTestTVC.view];
    
    self.ClassOneOrFour.selectedSegmentIndex = 0;
    [self.ClassOneOrFour addTarget:self action:@selector(segmentedControlAction:) forControlEvents:UIControlEventValueChanged];
    
}
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

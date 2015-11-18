//
//  LoginViewController.m
//  DriveTest
//
//  Created by jinke on 15/11/11.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *loginNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *loginPwdTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)loginAction:(UIButton *)sender {
    
    [AVUser logInWithUsernameInBackground:self.loginNameTextField.text password:self.loginPwdTextField.text block:^(AVUser *user, NSError *error) {
        if (error) {
            NSLog(@"出错啦");
            if ([self.loginNameTextField.text isEqualToString:@""] || [self.loginPwdTextField.text isEqualToString:@""]) {
                UIAlertController *alertController = nil;
                
                alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"账号或者密码不能为空，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
                
                
                UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                
                [alertController addAction:action1];
                
                [self presentViewController:alertController animated:YES completion:nil];
            }else
            {
                UIAlertController *alertController = nil;
                
                alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"账号或者密码错误，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
                
                
                UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                
                [alertController addAction:action1];
                
                [self presentViewController:alertController animated:YES completion:nil];
            }
        }else
        {
            NSLog(@"登录成功");
            AppDelegate *app = [UIApplication sharedApplication].delegate;
            app.loginType = YES;
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];

    
}
- (IBAction)toRegisterVC:(UIButton *)sender {
    
    RegisterViewController *registerVC = [RegisterViewController new];
    registerVC.valueBlock = ^(NSString *name,NSString *pwd) {
        self.loginNameTextField.text = name;
        self.loginPwdTextField.text = pwd;
    };
    [self.navigationController pushViewController:registerVC animated:YES];
//    [self setHidesBottomBarWhenPushed:YES];
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

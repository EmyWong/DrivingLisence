//
//  RegisterViewController.m
//  DriveTest
//
//  Created by jinke on 15/11/11.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *registerNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *registerPwdTextField;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)registerAction:(UIButton *)sender {
    
    AVUser *user = [AVUser user];
    user.username = self.registerNameTextField.text;
    user.password = self.registerPwdTextField.text;
    if (user.username.length <= 6 || user.password.length <= 6) {
        UIAlertController *alertController = nil;
        
        alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"账号或密码不能小于6位，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alertController addAction:action1];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }else
    {
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                
                [user saveInBackground];
                NSLog(@"注册成功");
                UIAlertController *alertController = nil;
                
                alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"注册成功" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                    self.valueBlock(self.registerNameTextField.text,self.registerPwdTextField.text);
                    [self.navigationController popViewControllerAnimated:YES];
                    
                }];
                
                [alertController addAction:action1];
                [self presentViewController:alertController animated:YES completion:nil];
                
            }
            else
            {
                NSLog(@"%@",error);
            }
        }];
        
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

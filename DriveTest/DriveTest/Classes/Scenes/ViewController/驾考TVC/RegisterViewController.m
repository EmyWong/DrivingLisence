//
//  RegisterViewController.m
//  DriveTest
//
//  Created by jinke on 15/11/11.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *registerNameTextField; // 账号
@property (weak, nonatomic) IBOutlet UITextField *registerPwdTextField; // 密码
@property (weak, nonatomic) IBOutlet UISegmentedControl *registerMethod; // 注册方法Segment
@property (weak, nonatomic) IBOutlet UITextField *registerPhoneTextField; // 手机号账号
@property (weak, nonatomic) IBOutlet UITextField *registerPhonePwdTextField; // 手机号密码
@property (weak, nonatomic) IBOutlet UITextField *verifyTextField; // 验证码
@property (weak, nonatomic) IBOutlet UIButton *verifyButton; // 获取验证码按钮
@property (weak, nonatomic) IBOutlet UIView *phoneReView; // 手机注册视图
@property (weak, nonatomic) IBOutlet UIView *userReView; // 用户注册视图

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self.registerMethod addTarget:self action:@selector(segmentedControlAction:) forControlEvents:UIControlEventValueChanged];
    self.phoneReView.hidden = YES;
//    self.registerPhoneTextField.userInteractionEnabled = NO;
//    self.registerPhonePwdTextField.userInteractionEnabled = NO;
//    self.verifyButton.userInteractionEnabled = NO;
//    self.verifyTextField.userInteractionEnabled = NO;
//    [self.registerNameTextField becomeFirstResponder];
    
}
#pragma mark - 获取手机验证码
- (IBAction)gainVerify:(UIButton *)sender {
    
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.registerPhoneTextField.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        if (!error) {
            __block int timeout=59; //倒计时时间
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
            dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
            dispatch_source_set_event_handler(_timer, ^{
                if(timeout<=0){ //倒计时结束，关闭
                    dispatch_source_cancel(_timer);
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //设置界面的按钮显示 根据自己需求设置
                        [_verifyButton setTitle:@"获取验证码" forState:UIControlStateNormal];
                        _verifyButton.userInteractionEnabled = YES;
                    });
                }else{
                    //            int minutes = timeout / 60;
                    int seconds = timeout % 60;
                    NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //设置界面的按钮显示 根据自己需求设置
                        NSLog(@"____%@",strTime);
                        [_verifyButton setTitle:[NSString stringWithFormat:@"剩余%@秒",strTime] forState:UIControlStateNormal];
                        _verifyButton.userInteractionEnabled = NO;
                        
                    });
                    timeout--;
                    
                }
            });
            dispatch_resume(_timer);
        }else
        {
            UIAlertController *alertController = nil;
            
            alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请输入正确地手机号码" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alertController addAction:action1];
            
            [self presentViewController:alertController animated:YES completion:nil];

        }
    }];
        //注意区号和手机号码前面都不要加“＋”号，有的开发者喜欢这样写，@“＋86”，这种是错误的写法
    
}
#pragma mark - 判断用哪种方式注册
- (void) segmentedControlAction:(UISegmentedControl *) sender
{
    if (self.registerMethod.selectedSegmentIndex == 0) {
        self.phoneReView.hidden = YES;
        self.userReView.hidden = NO;
//        self.registerNameTextField.userInteractionEnabled = YES;
//        self.registerPwdTextField.userInteractionEnabled = YES;
//        self.registerPhoneTextField.userInteractionEnabled = NO;
//        self.registerPhonePwdTextField.userInteractionEnabled = NO;
    }else
    {
        self.userReView.hidden = YES;
        self.phoneReView.hidden = NO;
//        self.registerNameTextField.userInteractionEnabled = NO;
//        self.registerPwdTextField.userInteractionEnabled = NO;
//        self.registerPhoneTextField.userInteractionEnabled = YES;
//        [self.registerPhoneTextField becomeFirstResponder];
//        self.registerPhonePwdTextField.userInteractionEnabled = YES;
//        self.verifyButton.userInteractionEnabled = YES;
//        self.verifyTextField.userInteractionEnabled = YES;
    }
}
#pragma mark - 注册方法(可能有点乱啊)
- (IBAction)registerAction:(UIButton *)sender {
    // 账号注册的方法
    if (self.registerMethod.selectedSegmentIndex == 0) {
        AVUser *user = [AVUser user];
        user.username = self.registerNameTextField.text;
        user.password = self.registerPwdTextField.text;
        if (user.username.length <= 6 || user.password.length <= 6) {
            UIAlertController *alertController = nil;
            
            alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"账号或密码不能小于6位，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
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
                    
                    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        
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

    }else // 手机号注册的方法
    {
        [SMSSDK commitVerificationCode:self.verifyTextField.text phoneNumber:self.registerPhoneTextField.text zone:@"86" result:^(NSError *error) {
            if (!error) {
                NSLog(@"验证成功");
                AVUser *user = [AVUser user];
                user.username = self.registerPhoneTextField.text;
                user.password = self.registerPhonePwdTextField.text;
                if (user.password.length <= 6) {
                    UIAlertController *alertController = nil;
                    
                    alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"账号或密码不能小于6位，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
                    
                    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        
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
                            
                            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                
                                self.valueBlock(self.registerPhoneTextField.text,self.registerPhonePwdTextField.text);
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
                
            }else
            {

                if (self.registerPhonePwdTextField.text.length <= 6) {
                    UIAlertController *alertController = nil;
                    
                    alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"密码不能小于6位，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
                    
                    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        
                    }];
                    
                    [alertController addAction:action1];
                    [self presentViewController:alertController animated:YES completion:nil];
                }else
                {
                    UIAlertController *alertController = nil;
                    
                    alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"验证码错误" preferredStyle:UIAlertControllerStyleAlert];
                    
                    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        
                    }];
                    
                    [alertController addAction:action1];
                    [self presentViewController:alertController animated:YES completion:nil];
                }
                
            }
        }];

    }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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

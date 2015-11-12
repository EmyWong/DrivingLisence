//
//  TestMethodVC.m
//  DriveTest
//
//  Created by 王颜华 on 15/11/11.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "TestMethodVC.h"

@interface TestMethodVC ()<UIWebViewDelegate,UIAlertViewDelegate>
//网页
@property (nonatomic,strong) UIWebView *webView;
//小菊花
@property (nonatomic,strong) UIActivityIndicatorView *activity;
@end

@implementation TestMethodVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(popAction:)];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 66)];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.webView];
    
    self.webView.scalesPageToFit = YES;
    NSURL *url = [NSURL URLWithString:self.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    if ([[NetWorkManager sharedWithManager] isConnectionAvailable]== NO) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"无网络连接" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else
    {
        
        self.activity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleGray)];
        _activity.frame = CGRectMake(0, 0, 30, 30);
        _activity.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2-64);
        [self.view addSubview:_activity];
        [_activity startAnimating];
        [self.webView loadRequest:request];
    }
    self.webView.delegate = self;

}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activity stopAnimating];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//返回按钮
- (void)popAction:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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

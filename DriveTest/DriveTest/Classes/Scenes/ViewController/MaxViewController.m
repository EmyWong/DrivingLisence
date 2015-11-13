//
//  MaxViewController.m
//  DriveTest
//
//  Created by 王颜华 on 15/11/13.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "MaxViewController.h"

@interface MaxViewController ()<UIScrollViewDelegate>
@property (nonatomic,retain) UIScrollView *scrollView;
@property (nonatomic,strong) UIPageControl *pageControl;

@end

@implementation MaxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.scrollView.contentSize =CGSizeMake(self.view.frame.size.width*self.drive.imageurl.count, self.view.frame.size.height);
    self.scrollView.pagingEnabled = YES;
    [self.view addSubview:self.scrollView];
    
    for (int i= 0; i < self.drive.imageurl.count; i++) {
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width*i, 20, self.view.frame.size.width, self.view.frame.size.height-40)];
        
        [imgView sd_setImageWithURL:[NSURL URLWithString:self.drive.imageurl[i][@"imgUrl"]] placeholderImage:[UIImage imageNamed:@"fail"]];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [imgView addGestureRecognizer:tap];
        imgView.userInteractionEnabled = YES;
        [self.scrollView addSubview:imgView];
    }
    
    self.scrollView.delegate = self;
    self.scrollView.delegate = self;
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 30)];
    self.pageControl.numberOfPages = self.drive.imageurl.count;
    [self.pageControl addTarget:self action:@selector(PageAction:) forControlEvents:(UIControlEventValueChanged)];
    [self.view addSubview:self.pageControl];
    
    
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"img"] isEqualToString:@"1"]) {
        [self.scrollView setContentOffset:CGPointMake(0, 0)];
    }
    else if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"img"] isEqualToString:@"2"]) {
        [self.scrollView setContentOffset:CGPointMake(self.view.frame.size.width, 0)];
    }
    else
    {
        [self.scrollView setContentOffset:CGPointMake(self.view.frame.size.width*2, 0)];
    }

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //使用偏移量/scrollView的宽度，得到当前页数的下标
    NSInteger index=self.scrollView.contentOffset.x/self.view.frame.size.width;
    //赋值给小点点
    self.pageControl.currentPage=index;
}
- (void)PageAction:(UIPageControl *)sender
{
    //计算出偏移量
    CGPoint offset=CGPointMake(self.scrollView.frame.size.width *sender.currentPage,0 );
    //将偏移量赋值给scrolview，并使用动画。
    [self.scrollView setContentOffset:offset animated:YES];
}
- (void)tapAction:(UITapGestureRecognizer *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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

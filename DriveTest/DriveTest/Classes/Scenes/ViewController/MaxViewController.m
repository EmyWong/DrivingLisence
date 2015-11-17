//
//  MaxViewController.m
//  DriveTest
//
//  Created by 王颜华 on 15/11/13.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "MaxViewController.h"

@interface MaxViewController ()<UIScrollViewDelegate,UIAlertViewDelegate>
{
    NSInteger _index;
}

@property (nonatomic,retain) UIScrollView *scrollView;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,strong) UIImageView *imgView;
@end

@implementation MaxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSInteger count;
    
    if (self.drive == nil) {
        count = self.imageArr.count;
        _index = -1;
    }else{
         count = self.drive.imageurl.count;
        _index = -2;
    }
    
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.scrollView.contentSize =CGSizeMake(self.view.frame.size.width*count, self.view.frame.size.height);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.minimumZoomScale = 0.5;
    self.scrollView.maximumZoomScale = 2;
    [self.view addSubview:self.scrollView];
    
    for (int i= 0; i < count; i++) {
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width*i, 20, self.view.frame.size.width, self.view.frame.size.height-40)];
        
        if (_index == -2) {
            [_imgView sd_setImageWithURL:[NSURL URLWithString:self.drive.imageurl[i][@"imgUrl"]] placeholderImage:[UIImage imageNamed:@"fail"]];
        }else{
            [_imgView setImage:self.imageArr[i]];
        }
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [_imgView addGestureRecognizer:tap];
        
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(tapSaveImageToIphone)];
        [_imgView addGestureRecognizer:longPress];
        
        
        _imgView.userInteractionEnabled = YES;
        [self.scrollView addSubview:_imgView];
    }
   
    
    self.scrollView.delegate = self;
    self.scrollView.delegate = self;
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 30)];
    self.pageControl.numberOfPages = count;
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
- (void)tapSaveImageToIphone{
    
    UIAlertController *alertController = [[UIAlertController alloc]init];
    
    UIAlertAction *cancel  = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];
    UIAlertAction *save = [UIAlertAction actionWithTitle:@"保存至相册" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        NSInteger index;
        index = self.pageControl.currentPage;
        UIImageView *imageView = [UIImageView new];
        if (_index == -2) {
            [imageView sd_setImageWithURL:[NSURL URLWithString:self.drive.imageurl[index][@"imgUrl"]]];
        }else{
            [imageView setImage:self.imageArr[index]];
        }
        UIImageWriteToSavedPhotosAlbum(imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }];
    [alertController addAction:cancel];
    [alertController addAction:save];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void*)contextInfo
{
    if (error == nil) {
        
        TimerDisappearAlertView *alert = [[TimerDisappearAlertView alloc]initWithTitle:@"保存成功"];
        [alert show];
        
    }else{
        
        
        TimerDisappearAlertView *alert = [[TimerDisappearAlertView alloc]initWithTitle:@"保存失败"];
        [alert show];
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

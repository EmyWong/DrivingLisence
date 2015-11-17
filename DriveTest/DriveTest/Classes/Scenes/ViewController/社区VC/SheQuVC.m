//
//  SheQuVC.m
//  DriveTest
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "SheQuVC.h"
#import "TieZi.h"


@interface SheQuVC ()

@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UIImageView *img2;
@property (weak, nonatomic) IBOutlet UIImageView *img3;
@property (weak, nonatomic) IBOutlet UIImageView *img4;
@property (weak, nonatomic) IBOutlet UIImageView *img5;
@property (weak, nonatomic) IBOutlet UIImageView *img6;

@property (weak, nonatomic) IBOutlet UIButton *btn1;

@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIButton *btn5;
@property (weak, nonatomic) IBOutlet UIButton *btn6;




@end

@interface SheQuVC ()<UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *myTtextView;
@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, strong) NSMutableArray *fileArr;
@end

@implementation SheQuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //设置返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(returnAction)];
    
    //设置发表按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发表" style:UIBarButtonItemStyleDone target:self action:@selector(faBiaoConnent)];
    self.myTtextView.backgroundColor = [UIColor whiteColor];
    
    
    self.myTtextView.clearsContextBeforeDrawing = YES;
    
    self.myTtextView.delegate = self;
    
    
    
    [self loadButtonAction];
    
    
    
//    [self.myTtextView becomeFirstResponder];
    

    
    
}

- (void)loadButtonAction
{
    [self.btn1 addTarget:self action:@selector(addImage) forControlEvents:UIControlEventTouchUpInside];
    self.img1.image = [UIImage imageNamed:@"addImage"];
//    [self.btn1 setImage:[UIImage imageNamed:@"addImage"] forState:UIControlStateNormal];
    
    
    [self.btn2 addTarget:self action:@selector(addImage) forControlEvents:UIControlEventTouchUpInside];
//    [self.btn2 setImage:[UIImage imageNamed:@"addImage"] forState:UIControlStateNormal];
    
    
    [self.btn3 addTarget:self action:@selector(addImage) forControlEvents:UIControlEventTouchUpInside];
//    [self.btn3 setImage:[UIImage imageNamed:@"addImage"] forState:UIControlStateNormal];
    
    
    [self.btn4 addTarget:self action:@selector(addImage) forControlEvents:UIControlEventTouchUpInside];
//    [self.btn4 setImage:[UIImage imageNamed:@"addImage"] forState:UIControlStateNormal];
    
    
    [self.btn5 addTarget:self action:@selector(addImage) forControlEvents:UIControlEventTouchUpInside];
//    [self.btn5 setImage:[UIImage imageNamed:@"addImage"] forState:UIControlStateNormal];
    
    
    [self.btn6 addTarget:self action:@selector(addImage) forControlEvents:UIControlEventTouchUpInside];
//    [self.btn6 setImage:[UIImage imageNamed:@"addImage"] forState:UIControlStateNormal];
    
    
    self.btn2.userInteractionEnabled = NO;
    self.btn3.userInteractionEnabled = NO;
    self.btn4.userInteractionEnabled = NO;
    self.btn5.userInteractionEnabled = NO;
    self.btn6.userInteractionEnabled = NO;
}






- (void)addImage
{
    NSLog(@"添加了手势");
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    UIImagePickerController * picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = sourceType;
    [self presentViewController:picker animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info1
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    [self performSelector:@selector(delayAction:) withObject:info1 afterDelay:0.1];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)delayAction:(NSDictionary *)info1
{
    UIImage * image=[info1 objectForKey:UIImagePickerControllerEditedImage];
    
    
    
    
    if (self.btn1.userInteractionEnabled == YES) {
        self.img1.image = image;
        self.btn1.userInteractionEnabled = NO;
        [self.imageArray addObject:image];
        
        
        self.btn2.userInteractionEnabled = YES;
        self.img2.image = [UIImage imageNamed:@"addImage"];
        return;

    }
    
    if (self.btn2.userInteractionEnabled == YES) {
        self.img2.image = image;
        self.btn2.userInteractionEnabled = NO;
        [self.imageArray addObject:image];
        
        self.btn3.userInteractionEnabled = YES;
        self.img3.image = [UIImage imageNamed:@"addImage"];
        return;
    }
    
    if (self.btn3.userInteractionEnabled == YES) {
        self.img3.image = image;
        self.btn3.userInteractionEnabled = NO;
        [self.imageArray addObject:image];
        
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"最多只能添加3张照片" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //
        }]];
        
        [self presentViewController:alert animated:YES completion:nil];
//
    }
    
//
}


- (void)preformDis:(NSTimer *)time
{
    
}




- (void)faBiaoConnent
{
    
//    self.imageArray = nil;
    TieZi *tiezi = [TieZi object];
    
    if (self.imageArray.count != 0) {
        for (UIImage *img in self.imageArray) {
            UIGraphicsBeginImageContext(CGSizeMake(100, 100));
            [img drawInRect:CGRectMake(0, 0, 100, 100)];
            UIImage *resImg = UIGraphicsGetImageFromCurrentImageContext();
            
            NSData *data = UIImageJPEGRepresentation(resImg, 1);
            
            AVFile *imgFile = [AVFile fileWithData:data];
            [imgFile save];
            
            [self.fileArr addObject:imgFile];
            
        }
        tiezi.imgArr = self.fileArr;
    }else{
        tiezi.imgArr = nil;
    }
    
    
    
    
    NSLog(@"%@", self.myTtextView.text);
    
    tiezi.content = self.myTtextView.text;
    
    
    
    tiezi.whereAdd = @"北京市";
    
    NSError *error = nil;
    
    [tiezi save:&error];
    if (error) {
        
    }else{
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    

    

    
    }

- (void)returnAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)textViewDidChange:(UITextView *)textView
{
    
    NSLog(@"line == %d  function == %s",__LINE__,__FUNCTION__);
}



- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([self.myTtextView.text isEqualToString:@"来说点什么吧.."]) {
        self.myTtextView.text = @"";
        self.myTtextView.textColor = [UIColor blackColor];
    }

    NSRange range;
    range.length = 0;
    range.location = 0;
    self.myTtextView.selectedRange = range;
    
    NSLog(@"line == %d  function == %s",__LINE__,__FUNCTION__);
}

- (void)textViewDidChangeSelection:(UITextView *)textView
{
    
    
    NSLog(@"line == %d  function == %s",__LINE__,__FUNCTION__);
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    
    
    
    NSLog(@"line == %d  function == %s",__LINE__,__FUNCTION__);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}








- (NSMutableArray *)imageArray
{
    if (!_imageArray) {
        self.imageArray = [[NSMutableArray alloc] initWithCapacity:4];
    }
    return _imageArray;
}


- (NSMutableArray *)fileArr
{
    if (!_fileArr) {
        self.fileArr = [[NSMutableArray alloc] initWithCapacity:3];
    }
    return _fileArr;
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

//
//  SheQuVC.m
//  DriveTest
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "SheQuVC.h"

@interface SheQuVC ()

@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UIImageView *img2;
@property (weak, nonatomic) IBOutlet UIImageView *img3;
@property (weak, nonatomic) IBOutlet UIImageView *img4;
@property (weak, nonatomic) IBOutlet UIImageView *img5;
@property (weak, nonatomic) IBOutlet UIImageView *img6;


@end

@interface SheQuVC ()<UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *myTtextView;
@property (nonatomic, strong) NSMutableArray *imageArray;

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
    
    
    
    [self loadImage];
    
    
    
//    [self.myTtextView becomeFirstResponder];
    

    
    
}


- (void)loadImage
{
    self.img1.image = [UIImage imageNamed:@"addImage"];
    
    self.img1.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addImage)];
    [self.img1 addGestureRecognizer:tap1];
}


- (void)addImage
{
    NSLog(@"添加了手势");
    
    UIImagePickerControllerSourceType sourceType=UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    }
    UIImagePickerController * picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing=YES;
    picker.sourceType=sourceType;
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
    
    self.img1.image = image;
    
    self.img2.image = [UIImage imageNamed:@"addImage"];
    
    
//    MDMUserInfo *info = [MDMUserHelper sharedMDMUserHelper].currentUser.info;
//    [info fetchIfNeededInBackgroundWithBlock:^(AVObject *object, NSError *error) {
//        AVFile *avfile = info.image;
//        NSData *data = UIImageJPEGRepresentation(image, 0.1);
//        AVFile *newAvfile = [AVFile fileWithData:data];
//        [newAvfile save];
//        info.image = newAvfile;
//        [info save];
//        [avfile deleteInBackground];
//        [self viewWillAppear:YES];
//    }];
}



- (void)faBiaoConnent
{
    NSLog(@"sadsadasd");
    NSLog(@"%@", self.myTtextView.text);
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

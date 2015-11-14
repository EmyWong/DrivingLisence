//
//  TaoLunCell.m
//  DriveTest
//
//  Created by lanou3g on 15/11/12.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "TaoLunCell.h"
@interface TaoLunCell ()
@property (nonatomic,strong) UITapGestureRecognizer *tap1;
@property (nonatomic,strong) UITapGestureRecognizer *tap2;
@property (nonatomic,strong) UITapGestureRecognizer *tap3;
@end
@implementation TaoLunCell

- (void)setDrive:(DriveDiscussion *)drive {

    [self.img1 removeGestureRecognizer:self.tap1];
    [self.img2 removeGestureRecognizer:self.tap2];
    [self.img3 removeGestureRecognizer:self.tap3];
    self.connent.text = drive.content;
    self.name.text = drive.nickname;
    self.time.text = drive.postdate;
    self.address.text = drive.local;
    self.dianzan.text = drive.liketip;
    self.pinglun.text = drive.commenttip;
    [self.touXiangImg sd_setImageWithURL:[NSURL URLWithString:drive.face]];
    NSArray * array = drive.imageurl;
    
    
    if (1 == array.count) {
        [self.img1 sd_setImageWithURL:[NSURL URLWithString:array[0][@"imgUrl"]]];
        self.img1.userInteractionEnabled = YES;
         self.tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Max1Action:)];
        [self.img1 addGestureRecognizer:self.tap1];
    }else if(2 == array.count) {
        [self.img1 sd_setImageWithURL:[NSURL URLWithString:array[0][@"imgUrl"]]];
        [self.img2 sd_setImageWithURL:[NSURL URLWithString:array[1][@"imgUrl"]]];
        self.img1.userInteractionEnabled = YES;
        self.tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Max1Action:)];
        [self.img1 addGestureRecognizer:self.tap1];
        self.img2.userInteractionEnabled = YES;
        self.tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Max2Action:)];
        [self.img2 addGestureRecognizer:self.tap2];

    }else {
        [self.img1 sd_setImageWithURL:[NSURL URLWithString:array[0][@"imgUrl"]]];
        [self.img2 sd_setImageWithURL:[NSURL URLWithString:array[1][@"imgUrl"]]];
        [self.img3 sd_setImageWithURL:[NSURL URLWithString:array[2][@"imgUrl"]]];
        self.img1.userInteractionEnabled = YES;
        self.tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Max1Action:)];
        [self.img1 addGestureRecognizer:self.tap1];
        self.img2.userInteractionEnabled = YES;
        self.tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Max2Action:)];
        [self.img2 addGestureRecognizer:self.tap2];
        self.img3.userInteractionEnabled = YES;
        self.tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Max3Action:)];
        [self.img3 addGestureRecognizer:self.tap3];

    }
    
            
       
    
}


- (void)awakeFromNib {


}
- (void)Max1Action:(UITapGestureRecognizer *)sender
{
    [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"img"];
    self.transportBlock();
}
- (void)Max2Action:(UITapGestureRecognizer *)sender
{
    [[NSUserDefaults standardUserDefaults]setValue:@"2" forKey:@"img"];
    self.transportBlock();
}
- (void)Max3Action:(UITapGestureRecognizer *)sender
{
    [[NSUserDefaults standardUserDefaults]setValue:@"3" forKey:@"img"];
    self.transportBlock();
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

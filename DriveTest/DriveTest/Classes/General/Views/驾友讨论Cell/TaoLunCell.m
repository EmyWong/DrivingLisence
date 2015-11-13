//
//  TaoLunCell.m
//  DriveTest
//
//  Created by lanou3g on 15/11/12.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "TaoLunCell.h"
@implementation TaoLunCell

- (void)setDrive:(DriveDiscussion *)drive {
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
    }else if(2 == array.count) {
        [self.img1 sd_setImageWithURL:[NSURL URLWithString:array[0][@"imgUrl"]]];
        [self.img2 sd_setImageWithURL:[NSURL URLWithString:array[1][@"imgUrl"]]];
    }else {
        [self.img1 sd_setImageWithURL:[NSURL URLWithString:array[0][@"imgUrl"]]];
        [self.img2 sd_setImageWithURL:[NSURL URLWithString:array[1][@"imgUrl"]]];
        [self.img3 sd_setImageWithURL:[NSURL URLWithString:array[2][@"imgUrl"]]];
    }
    
            
       
    
}


- (void)awakeFromNib {
    self.img1.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Max1Action:)];
    [self.img1 addGestureRecognizer:tap1];
    self.img2.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Max2Action:)];
    [self.img2 addGestureRecognizer:tap2];
    self.img3.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Max3Action:)];
    [self.img3 addGestureRecognizer:tap3];

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

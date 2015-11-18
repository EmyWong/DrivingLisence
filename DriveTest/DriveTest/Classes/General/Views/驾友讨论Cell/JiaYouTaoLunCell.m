//
//  JiaYouTaoLunCell.m
//  DriveTest
//
//  Created by lanou3g on 15/11/12.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "JiaYouTaoLunCell.h"
#import "TieZi.h"




@interface JiaYouTaoLunCell ()

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *connent;
@property (weak, nonatomic) IBOutlet UILabel *address;


@property (weak, nonatomic) IBOutlet UIImageView *imgView;




@end


@implementation JiaYouTaoLunCell

- (void)setDrive:(DriveDiscussion *)drive {
    self.connent.text = drive.content;
    self.name.text = drive.nickname;
    self.time.text = drive.postdate;
    self.address.text = drive.local;
    self.dianZan.text = drive.liketip;
    self.pinglunNumber.text = drive.commenttip;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:drive.face]];
}

- (void)setTiezi:(TieZi *)tiezi
{
    self.connent.text = tiezi.content;
    
    self.name.text = @"南山南";
    NSDate *data = tiezi.createdAt;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *string = [formatter stringFromDate:data];
    self.time.text = string;
    self.address.text = @"北京市";
    self.dianZan.text = @"2";
    self.pinglunNumber.text = @"0";
    
    [self.imgView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%u", arc4random()%37]]];
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

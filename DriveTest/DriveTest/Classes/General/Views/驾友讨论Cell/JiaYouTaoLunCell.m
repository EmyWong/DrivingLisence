//
//  JiaYouTaoLunCell.m
//  DriveTest
//
//  Created by lanou3g on 15/11/12.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "JiaYouTaoLunCell.h"

@interface JiaYouTaoLunCell ()

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *connent;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *dianZan;
@property (weak, nonatomic) IBOutlet UILabel *pinglunNumber;
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


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  JLPLCell.m
//  DriveTest
//
//  Created by lanou3g on 15/11/11.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "JLPLCell.h"

@interface JLPLCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *feiyong;
@property (weak, nonatomic) IBOutlet UILabel *biaoyu;
@property (weak, nonatomic) IBOutlet UILabel *dianhua;
@property (weak, nonatomic) IBOutlet UILabel *jianjie;
@property (weak, nonatomic) IBOutlet UILabel *number;


@end




@implementation JLPLCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

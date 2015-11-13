//
//  DriveSchoolCell.m
//  DriveTest
//
//  Created by lanou3g on 15/11/10.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "DriveSchoolCell.h"
#import "Infolist.h"
#import "UIImageView+WebCache.h"
@interface DriveSchoolCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *attentionnumLabel;
@property (nonatomic, strong) UILabel *amountLabel;

@property (nonatomic,strong) WYHStarRateView *starRateView;

@end
@implementation DriveSchoolCell


- (void)setInfo:(Infolist *)info {
    self.nameLabel.text = info.name;
    self.attentionnumLabel.text = info.attentionnum;
    self.amountLabel.text = info.amount;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:info.picurl]placeholderImage:[UIImage imageNamed:@"fail.png"]];

    self.starRateView.scorePercent=info.score/5;
}

- (void)awakeFromNib {
    
    self.starRateView = [[WYHStarRateView alloc] initWithFrame:CGRectMake(0, (self.attentionnumLabel.frame.origin.y - self.nameLabel.frame.origin.y - self.nameLabel.frame.size.height)/2, 80, 25) numberOfStars:5];
    self.starRateView.scorePercent = 0.2;
    self.starRateView.allowIncompleteStar = YES;
    self.starRateView.hasAnimation = YES;
    [self.nameLabel addSubview:self.starRateView];
    
    
    self.amountLabel = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth - self.nameLabel.frame.origin.x - 70 ,0, 60, 25)];
    self.amountLabel.textColor = [UIColor redColor];
    self.amountLabel.font = [UIFont systemFontOfSize:15];
    [self.starRateView addSubview:self.amountLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    NSLog(@"%@",self.nameLabel.text);
}

@end

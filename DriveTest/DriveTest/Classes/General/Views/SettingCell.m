//
//  SettingCell.m
//  DriveTest
//
//  Created by 王颜华 on 15/11/17.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "SettingCell.h"
@interface SettingCell ()

@end
@implementation SettingCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addAllViews];
    }
    return self;
}
- (void)addAllViews
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHight*240/667)];
    view.backgroundColor = [UIColor colorWithRed:117/255.0 green:197/255.0  blue:3/255.0 alpha:1];
    [self.contentView addSubview:view];
    
    self.HeadImage = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/2-(kScreenHight*50/667), kScreenHight*50/667, kScreenHight*100/667, kScreenHight*100/667 )];
    self.HeadImage.layer.cornerRadius = self.HeadImage.frame.size.width/2;
    self.HeadImage.layer.masksToBounds = YES;
    self.HeadImage.backgroundColor = [UIColor whiteColor];
    self.HeadImage.image = [UIImage imageNamed:@"touxiang.jpg"];
    [view addSubview:self.HeadImage];
    
    self.accountName = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.accountName.frame = CGRectMake(0, kScreenHight*170/667, kScreenWidth, 20);
    self.accountName.tintColor = [UIColor whiteColor];
    self.accountName.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.accountName setTitle:@"未设置昵称" forState:(UIControlStateNormal)];
    [view addSubview:self.accountName];

}
- (void)awakeFromNib {
    }
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

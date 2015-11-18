//
//  JiaYouTaoLunCell.h
//  DriveTest
//
//  Created by lanou3g on 15/11/12.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TieZi;
@class DriveDiscussion;


@interface JiaYouTaoLunCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *pinglunBut;
@property (weak, nonatomic) IBOutlet UIButton *dianzanBnt;
@property (nonatomic,strong) DriveDiscussion * drive;

@property (nonatomic, strong) TieZi *tiezi;


@property (weak, nonatomic) IBOutlet UILabel *dianZan;

@property (weak, nonatomic) IBOutlet UILabel *pinglunNumber;



@end

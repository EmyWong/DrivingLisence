//
//  TaoLunCell.h
//  DriveTest
//
//  Created by lanou3g on 15/11/12.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^TransportBlock)();
@interface TaoLunCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *touXiangImg;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *connent;

@property (weak, nonatomic) IBOutlet UIImageView *img1;

@property (weak, nonatomic) IBOutlet UIImageView *img2;
@property (weak, nonatomic) IBOutlet UIImageView *img3;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *dianzan;

@property (weak, nonatomic) IBOutlet UILabel *pinglun;
@property (weak, nonatomic) IBOutlet UIButton *dianzanBTN;
@property (weak, nonatomic) IBOutlet UIButton *pinglunBTN;

@property (nonatomic,strong) DriveDiscussion * drive;
@property (nonatomic,strong) TransportBlock transportBlock;





@end

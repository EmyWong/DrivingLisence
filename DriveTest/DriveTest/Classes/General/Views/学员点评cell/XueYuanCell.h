//
//  XueYuanCell.h
//  DriveTest
//
//  Created by lanou3g on 15/11/13.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Commentlist;
@interface XueYuanCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *touXiang;
@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *connent;

@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UIButton *dianzanBTN;
@property (weak, nonatomic) IBOutlet UILabel *dianzanNum;

@property (nonatomic,strong)Commentlist * commentlist;

@end

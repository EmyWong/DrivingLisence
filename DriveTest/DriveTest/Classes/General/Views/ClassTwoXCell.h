//
//  ClassTwoXCell.h
//  DriveTest
//
//  Created by lanou3g on 15/11/14.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ListHelper;
@interface ClassTwoXCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *kaoqianzhunbei;

@property (weak, nonatomic) IBOutlet UIButton *mijizhidao;

@property (weak, nonatomic) IBOutlet UIButton *hegebiaozhun;
@property (weak, nonatomic) IBOutlet UIButton *xiaotieshi;
@property (weak, nonatomic) IBOutlet UIButton *kaoshijingyan;
@property (weak, nonatomic) IBOutlet UIButton *comment;




@property (weak, nonatomic) IBOutlet UIImageView *img7;

@property (weak, nonatomic) IBOutlet UIImageView *img6;
@property (weak, nonatomic) IBOutlet UIImageView *img5;

@property (weak, nonatomic) IBOutlet UIImageView *img4;
@property (weak, nonatomic) IBOutlet UIImageView *img3;
@property (weak, nonatomic) IBOutlet UIImageView *img2;

@property (weak, nonatomic) IBOutlet UIImageView *img1;

@property (weak, nonatomic) IBOutlet UILabel *number;

@property (nonatomic,strong)ListHelper * listHelper;

@end

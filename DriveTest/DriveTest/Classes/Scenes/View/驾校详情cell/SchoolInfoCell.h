//
//  SchoolInfoCell.h
//  DriveTest
//
//  Created by lanou3g on 15/11/11.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SchoolInfoCell : UITableViewCell
@property (nonatomic,strong)ClickJxInfo * clickJxInfo;


@property (weak, nonatomic) IBOutlet UIButton *phoneNumber;
@property (weak, nonatomic) IBOutlet UIButton *luXianButton;
@property (weak, nonatomic) IBOutlet UIButton *jianJieButton;
@property (weak, nonatomic) IBOutlet UIButton *teSeButton;
@property (weak, nonatomic) IBOutlet UIButton *xinWenButton;
@property (weak, nonatomic) IBOutlet UIButton *taoLunButton;
@property (weak, nonatomic) IBOutlet UIButton *dianPingButton;
@property (weak, nonatomic) IBOutlet UIButton *genduou;


@end

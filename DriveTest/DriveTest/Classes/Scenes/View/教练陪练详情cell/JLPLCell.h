//
//  JLPLCell.h
//  DriveTest
//
//  Created by lanou3g on 15/11/11.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JLPLCell : UITableViewCell
@property (nonatomic,strong)ClickJxInfo * clickJxInfo;

@property (weak, nonatomic) IBOutlet UIButton *phoneNumber;
@property (weak, nonatomic) IBOutlet UIButton *jianJie;
@property (weak, nonatomic) IBOutlet UIButton *dianPing;


@end

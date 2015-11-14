//
//  RoadTwoTestCell.h
//  DriveTest
//
//  Created by lanou3g on 15/11/10.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ListHelper;
@interface RoadTwoTestCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *kaoQianButton;

@property (weak, nonatomic) IBOutlet UIButton *heGeButton;
@property (weak, nonatomic) IBOutlet UIButton *jinYanButton;

@property (weak, nonatomic) IBOutlet UIButton *miJiButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;

@property (nonatomic,strong)ListHelper * listHelper;

@end

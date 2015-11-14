//
//  RoadThreeTestCell.h
//  DriveTest
//
//  Created by lanou3g on 15/11/10.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ListHelper;
@interface RoadThreeTestCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *pingPanButton;

@property (weak, nonatomic) IBOutlet UIButton *roadTestButton;
@property (weak, nonatomic) IBOutlet UIButton *kaoChangButton;

@property (weak, nonatomic) IBOutlet UIButton *miJiButton;
@property (weak, nonatomic) IBOutlet UIButton *CommentButton;
@property (nonatomic,strong)ListHelper * listHelper;
@end

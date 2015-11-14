//
//  ClassOneCell.h
//  DriveTest
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ListHelper;
@interface ClassOneCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *shunXuButton;
@property (weak, nonatomic) IBOutlet UIButton *suiJiButton;
@property (weak, nonatomic) IBOutlet UIButton *faGuiButton;
@property (weak, nonatomic) IBOutlet UIButton *kaoShiButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;

@property (nonatomic,strong)ListHelper * listHelper;

@end

//
//  DriveSchoolCell.h
//  DriveTest
//
//  Created by lanou3g on 15/11/10.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Infolist;
@interface DriveSchoolCell : UITableViewCell
@property (nonatomic,strong)Infolist * info;
@property (weak, nonatomic) IBOutlet UIButton *selectButton;

@end

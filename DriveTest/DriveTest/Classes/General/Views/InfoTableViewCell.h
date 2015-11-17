//
//  InfoTableViewCell.h
//  DriveTest
//
//  Created by 王颜华 on 15/11/17.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *IconImage;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *accountNumber;

@end

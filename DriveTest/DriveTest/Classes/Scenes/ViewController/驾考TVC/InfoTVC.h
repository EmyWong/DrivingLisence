//
//  InfoTVC.h
//  DriveTest
//
//  Created by 王颜华 on 15/11/17.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoTableViewCell.h"
#import "Info2TableViewCell.h"
typedef void (^PassImage)(UIImage *);
typedef void (^PassValue)(NSString *);
@interface InfoTVC : UITableViewController
@property (nonatomic,strong) PassImage passimage;
@property (nonatomic,strong) PassValue passvalue;

@property (nonatomic,strong) Info2TableViewCell *cell1;
@property (nonatomic,strong) Info2TableViewCell *cell2;
@property (nonatomic,strong) Info2TableViewCell *cell3;
@property (nonatomic,strong) InfoTableViewCell *cell;
@end

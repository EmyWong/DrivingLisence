//
//  InfoTVC.h
//  DriveTest
//
//  Created by 王颜华 on 15/11/17.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^PassImage)(UIImage *);
@interface InfoTVC : UITableViewController
@property (nonatomic,strong) PassImage passimage;
@end

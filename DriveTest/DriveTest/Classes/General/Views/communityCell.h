//
//  communityCell.h
//  DriveTest
//
//  Created by jinke on 15/11/13.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TieZi;


@interface communityCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *content;

@property (weak, nonatomic) IBOutlet UILabel *creatTime;

@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UIImageView *img2;
@property (weak, nonatomic) IBOutlet UIImageView *img3;



@property (nonatomic, strong) TieZi *tiezi;




@end

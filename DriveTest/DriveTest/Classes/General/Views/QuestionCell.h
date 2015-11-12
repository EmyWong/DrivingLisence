//
//  QuestionCell.h
//  JiakaoDemo
//
//  Created by 王颜华 on 15/11/7.
//  Copyright © 2015年 王颜华. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestResult.h"
@interface QuestionCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIButton *item1Btn;
@property (weak, nonatomic) IBOutlet UIButton *item2Btn;
@property (weak, nonatomic) IBOutlet UIButton *item3Btn;
@property (weak, nonatomic) IBOutlet UIButton *item4Btn;
@property (nonatomic,strong) TestResult *test;
@property (weak, nonatomic) IBOutlet UIButton *lastOne;
@property (weak, nonatomic) IBOutlet UIButton *Save;
@property (weak, nonatomic) IBOutlet UIButton *nextOne;
@property (weak, nonatomic) IBOutlet UILabel *explainLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@end

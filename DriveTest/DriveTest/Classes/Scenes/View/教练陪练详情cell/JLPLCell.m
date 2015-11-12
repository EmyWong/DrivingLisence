//
//  JLPLCell.m
//  DriveTest
//
//  Created by lanou3g on 15/11/11.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "JLPLCell.h"

@interface JLPLCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *feiyong;
@property (weak, nonatomic) IBOutlet UILabel *biaoyu;
@property (weak, nonatomic) IBOutlet UILabel *dianhua;
@property (weak, nonatomic) IBOutlet UILabel *jianjie;
@property (weak, nonatomic) IBOutlet UILabel *number;


@end




@implementation JLPLCell

- (void)setClickJxInfo:(ClickJxInfo *)clickJxInfo {
    //baseinfoarea字典（电话，地址，班车路线）
    Titlearea * titlearea = [Titlearea new];
    [titlearea setValuesForKeysWithDictionary:clickJxInfo.titlearea];
    self.name.text = titlearea.name;
    self.feiyong.text = [titlearea.amount stringByAppendingString:titlearea.priceunit];
    self.biaoyu.text = titlearea.memo;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:titlearea.imageurl]placeholderImage:[UIImage imageNamed:@"fail.png"]];
 
    //descarea教练简介  descarea陪练简介
    Descarea * descarea = [Descarea new];
    [descarea setValuesForKeysWithDictionary:clickJxInfo.descarea];
    self.jianjie.text = descarea.text;
    
    //学员点评：commentarea 字典
    Commentarea * commentarea = [Commentarea new];
    [commentarea setValuesForKeysWithDictionary:clickJxInfo.commentarea];
    NSLog(@"%@",commentarea.moretext);
    self.number.text = commentarea.moretext;
    
    
    
    //电话
    Baseinfoarea * base = [Baseinfoarea new];
    [base setValuesForKeysWithDictionary:clickJxInfo.baseinfoarea];
    NSMutableArray *resArr = [[NSMutableArray alloc] initWithCapacity:1];
    NSArray *arr = base.tel;
    //转id类型数据
    for (id obj in arr) {
        NSString *str = [NSString stringWithFormat:@"%@", obj];
        [resArr addObject:str];
    }
    
    NSInteger count = resArr.count;
    if (count == 0) {
        self.dianhua.text = @"无";
    }else {
        self.dianhua.text = resArr[0];
    }

}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

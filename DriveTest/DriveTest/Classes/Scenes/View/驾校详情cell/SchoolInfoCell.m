//
//  SchoolInfoCell.m
//  DriveTest
//
//  Created by lanou3g on 15/11/11.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "SchoolInfoCell.h"

@interface SchoolInfoCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *jiaXiaoName;
@property (weak, nonatomic) IBOutlet UILabel *xueFei;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *number2;
@property (weak, nonatomic) IBOutlet UILabel *dizhi;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *pingLunRenShu;
@property (weak, nonatomic) IBOutlet UILabel *dianPinRenShu;



@end



@implementation SchoolInfoCell

- (void)setClickJxInfo:(ClickJxInfo *)clickJxInfo
{
    //驾校联系方式： titlearea字典（驾校照片numbers，驾校名，费用，关注人数，等级，）驾校地址： baseinfoarea字典（电话，地址，班车路线）
    Titlearea * titlearea = [Titlearea new];
    [titlearea setValuesForKeysWithDictionary:clickJxInfo.titlearea];
    self.jiaXiaoName.text = titlearea.name;
    self.xueFei.text = [titlearea.amount stringByAppendingString:@"元"];
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:titlearea.imageurl]placeholderImage:[UIImage imageNamed:@"fail.png"]];
    //驾校地址： baseinfoarea字典（电话，地址，班车路线）
    Baseinfoarea * base = [Baseinfoarea new];
    [base setValuesForKeysWithDictionary:clickJxInfo.baseinfoarea];
    self.dizhi.text = base.mapaddr[@"text"];
    
    NSMutableArray *resArr = [[NSMutableArray alloc] initWithCapacity:1];
    NSArray *arr = base.tel;
    //转id类型数据
    for (id obj in arr) {
        NSString *str = [NSString stringWithFormat:@"%@", obj];
        [resArr addObject:str];
    }
    
    NSInteger count = resArr.count;
    if (count == 0) {
        self.number.text = @"无";
        self.number2.text = @"";
    }else if(count == 1){
        self.number.text = resArr[0];
        self.number2.text = @"";
    }else{
        self.number.text = resArr.firstObject;
        self.number2.text = resArr.lastObject;
    }
    
    
    //驾校简介：descarea字典（内含 驾校特色，驾校新闻，更多）
    Descarea * descarea = [Descarea new];
    [descarea setValuesForKeysWithDictionary:clickJxInfo.descarea];
    self.content.text = descarea.text;
    
    //公交驾校： bbsgrouparea字典（驾友讨论 ，只显示七个驾友头像）
    Bbsgrouparea * bbsgrouparea = [Bbsgrouparea new];
    [bbsgrouparea setValuesForKeysWithDictionary:clickJxInfo.bbsgrouparea];
    self.name.text = bbsgrouparea.title;
    NSString * youStr = @"有";
    self.pingLunRenShu.text = [youStr stringByAppendingString:[NSString stringWithFormat:@"%ld名驾友参与讨论",bbsgrouparea.articletip]];
    //学员点评：commentarea 字典
    Commentarea * commentarea = [Commentarea new];
    [commentarea setValuesForKeysWithDictionary:clickJxInfo.commentarea];
    if (commentarea.moretext == nil) {
        self.dianPinRenShu.text = @"暂无学员点评";
    }else{
        self.dianPinRenShu.text = commentarea.moretext;
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

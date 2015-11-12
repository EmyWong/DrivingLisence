//
//  ClassFourCell.m
//  DriveTest
//
//  Created by lanou3g on 15/11/10.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "ClassFourCell.h"

@interface ClassFourCell ()
@property (weak, nonatomic) IBOutlet UILabel *numberCommentLabel;

@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UIImageView *img2;

@property (weak, nonatomic) IBOutlet UIImageView *img3;
@property (weak, nonatomic) IBOutlet UIImageView *img4;
@property (weak, nonatomic) IBOutlet UIImageView *img5;
@property (weak, nonatomic) IBOutlet UIImageView *img6;
@property (weak, nonatomic) IBOutlet UIImageView *img7;

@property (nonatomic,strong) NSMutableArray *allPicArr;
@end


@implementation ClassFourCell

- (void)awakeFromNib {
    NSURL *url = [NSURL URLWithString:kJxcommentUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //测试是否有网络连接
    if ([[NetWorkManager sharedWithManager] isConnectionAvailable]== NO) {
       
    }
    else
    {
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
        NSMutableDictionary *dic1 = dic[@"result"];
        NSMutableDictionary *dic2 = dic1[@"list"];
        NSMutableArray *arr = dic2[@"photolist"];
        self.allPicArr = [NSMutableArray arrayWithCapacity:7];
        [self.allPicArr addObjectsFromArray:arr];
        [self.img1 sd_setImageWithURL:[NSURL URLWithString:self.allPicArr[0]]];
        [self.img2 sd_setImageWithURL:[NSURL URLWithString:self.allPicArr[1]]];
        [self.img3 sd_setImageWithURL:[NSURL URLWithString:self.allPicArr[2]]];
        [self.img4 sd_setImageWithURL:[NSURL URLWithString:self.allPicArr[3]]];
        [self.img5 sd_setImageWithURL:[NSURL URLWithString:self.allPicArr[4]]];
        [self.img6 sd_setImageWithURL:[NSURL URLWithString:self.allPicArr[5]]];
        [self.img7 sd_setImageWithURL:[NSURL URLWithString:self.allPicArr[6]]];
        
    }];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  RoadTwoTestCell.m
//  DriveTest
//
//  Created by lanou3g on 15/11/10.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "RoadTwoTestCell.h"

@interface RoadTwoTestCell ()
@property (weak, nonatomic) IBOutlet UILabel *haveNumberP;

@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UIImageView *img2;
@property (weak, nonatomic) IBOutlet UIImageView *img3;
@property (weak, nonatomic) IBOutlet UIImageView *img4;
@property (weak, nonatomic) IBOutlet UIImageView *img5;
@property (weak, nonatomic) IBOutlet UIImageView *img6;
@property (weak, nonatomic) IBOutlet UIImageView *img7;

@property (nonatomic,strong) NSMutableArray *allPicArr;

@end



@implementation RoadTwoTestCell

- (void)setListHelper:(ListHelper *)listHelper {
    self.haveNumberP.text = [NSString stringWithFormat:@"有%ld",listHelper.totalusercount];
    self.allPicArr = [NSMutableArray array];
    for (NSDictionary * dic  in listHelper.infolist) {
        DriveDiscussion * driveDiscussion = [DriveDiscussion new];
        [driveDiscussion setValuesForKeysWithDictionary:dic];
        [self.allPicArr addObject:driveDiscussion.face];
    }
    if (self.allPicArr.count > 8) {
        [self.allPicArr removeObjectAtIndex:0];
        [self.allPicArr removeObjectAtIndex:0];
        [self.img1 sd_setImageWithURL:[NSURL URLWithString:self.allPicArr[0]]];
        [self.img2 sd_setImageWithURL:[NSURL URLWithString:self.allPicArr[1]]];
        [self.img3 sd_setImageWithURL:[NSURL URLWithString:self.allPicArr[2]]];
        [self.img4 sd_setImageWithURL:[NSURL URLWithString:self.allPicArr[3]]];
        [self.img5 sd_setImageWithURL:[NSURL URLWithString:self.allPicArr[4]]];
        [self.img6 sd_setImageWithURL:[NSURL URLWithString:self.allPicArr[5]]];
        [self.img7 sd_setImageWithURL:[NSURL URLWithString:self.allPicArr[6]]];
        
    }
    
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

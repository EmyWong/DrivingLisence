//
//  ThRreeCell.m
//  DriveTest
//
//  Created by lanou3g on 15/11/14.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "ThRreeCell.h"

@interface ThRreeCell()
@property (nonatomic,strong) NSMutableArray *allPicArr;
@end

@implementation ThRreeCell

- (void)setListHelper:(ListHelper *)listHelper {
    self.number.text = [NSString stringWithFormat:@"有%ld",listHelper.totalusercount];
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


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

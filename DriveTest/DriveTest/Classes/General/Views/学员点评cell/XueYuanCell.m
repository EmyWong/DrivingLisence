//
//  XueYuanCell.m
//  DriveTest
//
//  Created by lanou3g on 15/11/13.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "XueYuanCell.h"

@implementation XueYuanCell

- (void)setCommentlist:(Commentlist *)commentlist {
    self.name.text = commentlist.name;
    self.connent.text = commentlist.comment;
    self.time.text = commentlist.time;
    self.dianzanNum.text = [NSString stringWithFormat:@"%ld", commentlist.likecount];
    
    NSInteger num = arc4random()%37;
    self.touXiang.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld", num]];
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

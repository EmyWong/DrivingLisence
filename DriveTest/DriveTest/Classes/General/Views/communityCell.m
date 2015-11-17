//
//  communityCell.m
//  DriveTest
//
//  Created by jinke on 15/11/13.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "communityCell.h"
#import "TieZi.h"

@interface communityCell ()

@property (nonatomic, strong) NSMutableArray *allArray;

@end

@implementation communityCell



- (void)setTiezi:(TieZi *)tiezi
{
    
    self.allArray = nil;
    NSLog(@"!!!!!!!!!!!%@",tiezi);
    self.content.text = tiezi.content;
    
    self.creatTime.text = [NSString stringWithFormat:@"%@", tiezi.createdAt];
    
    for (AVFile *obj in tiezi.imgArr) {
        NSData *data = [obj getData];
        NSLog(@"%@", data);
        UIImage *image = [UIImage imageWithData:data];
        [self.allArray addObject:image];
    }
    
    
    if (1 == self.allArray.count) {
        
        self.img1.image = self.allArray.firstObject;
        
//        [self.img1 sd_setImageWithURL:[NSURL URLWithString:array[0][@"imgUrl"]]];
//        self.img1.userInteractionEnabled = YES;
//        self.tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Max1Action:)];
//        [self.img1 addGestureRecognizer:self.tap1];
    }else if(2 == self.allArray.count) {
        self.img1.image = self.allArray[0];
        self.img2.image = self.allArray[1];
    }else {
        self.img1.image = self.allArray[0];
        self.img2.image = self.allArray[1];
        self.img3.image = self.allArray[2];
        
    }

    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (NSMutableArray *)allArray
{
    if (!_allArray) {
        self.allArray = [[NSMutableArray alloc] initWithCapacity:3];
    }
    return _allArray;
}


@end

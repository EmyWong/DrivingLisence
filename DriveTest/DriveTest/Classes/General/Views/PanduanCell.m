//
//  PanduanCell.m
//  kaoshi
//
//  Created by 王颜华 on 15/11/9.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "PanduanCell.h"

@implementation PanduanCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setTest:(TestResult *)test
{
    _test = test;
    
    
    //初始化视图
    [self.item1Btn setImage:[UIImage imageNamed:@"weixuanzhong"] forState:(UIControlStateNormal)];
    [self.item2Btn setImage:[UIImage imageNamed:@"weixuanzhong"] forState:(UIControlStateNormal)];
    self.item1Btn.userInteractionEnabled = YES;
    self.item2Btn.userInteractionEnabled = YES;
    
    self.questionLabel.text =[NSString stringWithFormat:@"%@",test.question];
    
    self.item1Label.text = test.item1;
    self.item2Label.text = test.item2;
    self.explainLabel.hidden = YES;
    self.detailLabel.text = test.explains;
    self.detailLabel.hidden = YES;
   
        //判断是否选中
    
    if ([test.checkStr isEqualToString:@"1"]) {
        [self.item1Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
        self.item2Btn.userInteractionEnabled = NO;
    }
    if ([test.checkStr isEqualToString:@"2"]) {
        [self.item2Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
        self.item1Btn.userInteractionEnabled = NO;
    }
    
}
- (IBAction)ChooseAAction:(UIButton *)sender {
    if([sender.imageView.image isEqual:[UIImage imageNamed:@"weixuanzhong"]])
    {
        [self.item1Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
        self.test.checkStr = @"1";
        self.item2Btn.userInteractionEnabled = NO;
        
        if (![self.test.answer isEqualToString:self.test.checkStr]) {
            //做错的话，加入错题集
            if ([TestHelper sharedHelper].CuoTiArr.count == 0)
            {
                [[TestHelper sharedHelper]addCuoti:self.test];
            }
            else
            {
                BOOL flag = NO;
                for (TestResult *test in [TestHelper sharedHelper].CuoTiArr) {
                    if ([self.test isEqual:test]) {
                        flag = YES;
                    }
                }
                if (flag == NO) {
                    [[TestHelper sharedHelper]addCuoti:self.test];
                }
            }
            [self.item2Btn setImage:[UIImage imageNamed:@"cuoti"] forState:(UIControlStateNormal)];
            
            [self.item1Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            
            self.detailLabel.hidden = NO;
            self.explainLabel.text = @"解释:";
            self.explainLabel.hidden = NO;
        }
        else
        {
            self.explainLabel.hidden = NO;
            self.explainLabel.text = @"恭喜，回答正确！";
        }
    }
    else
    {
        [self.item1Btn setImage:[UIImage imageNamed:@"weixuanzhong"] forState:(UIControlStateNormal)];
        self.item2Btn.userInteractionEnabled = YES;
        
        self.test.checkStr = @"";
    }
}
- (IBAction)ChooseBAction:(UIButton *)sender {
    if([sender.imageView.image isEqual:[UIImage imageNamed:@"weixuanzhong"]])
    {
        [self.item2Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
        self.test.checkStr = @"2";
        self.item1Btn.userInteractionEnabled = NO;
        
        if (![self.test.answer isEqualToString:self.test.checkStr]) {
            if ([TestHelper sharedHelper].CuoTiArr.count == 0)
            {
                [[TestHelper sharedHelper]addCuoti:self.test];
            }
            else
            {
                BOOL flag = NO;
                for (TestResult *test in [TestHelper sharedHelper].CuoTiArr) {
                    if ([self.test isEqual:test]) {
                        flag = YES;
                    }
                }
                if (flag == NO) {
                    [[TestHelper sharedHelper]addCuoti:self.test];
                }
            }
            self.detailLabel.hidden = NO;
            
            
            [self.item2Btn setImage:[UIImage imageNamed:@"cuoti"] forState:(UIControlStateNormal)];
            
            [self.item1Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
           

            self.explainLabel.text = @"解释:";
            self.explainLabel.hidden = NO;
        }
        else
        {
            self.explainLabel.hidden = NO;
            self.explainLabel.text = @"恭喜，回答正确！";
        }
    }
    else
    {
        [self.item2Btn setImage:[UIImage imageNamed:@"weixuanzhong"] forState:(UIControlStateNormal)];
        
        self.test.checkStr = @"";
        self.item1Btn.userInteractionEnabled = YES;
    }
    sender.selected = !sender.selected;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

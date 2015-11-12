//
//  QuestionCell.m
//  JiakaoDemo
//
//  Created by 王颜华 on 15/11/7.
//  Copyright © 2015年 王颜华. All rights reserved.
//

#import "QuestionCell.h"
@interface QuestionCell ()

@property (weak, nonatomic) IBOutlet UILabel *item1Label;
@property (weak, nonatomic) IBOutlet UILabel *item2Label;
@property (weak, nonatomic) IBOutlet UILabel *item3Label;
@property (weak, nonatomic) IBOutlet UILabel *item4Label;



@end
@implementation QuestionCell

- (void)awakeFromNib {
    }
- (void)setTest:(TestResult *)test
{
    _test = test;
    
    
    //初始化视图
    [self.item1Btn setImage:[UIImage imageNamed:@"weixuanzhong"] forState:(UIControlStateNormal)];
    [self.item2Btn setImage:[UIImage imageNamed:@"weixuanzhong"] forState:(UIControlStateNormal)];
    [self.item3Btn setImage:[UIImage imageNamed:@"weixuanzhong"] forState:(UIControlStateNormal)];
    [self.item4Btn setImage:[UIImage imageNamed:@"weixuanzhong"] forState:(UIControlStateNormal)];
    self.item1Btn.userInteractionEnabled = YES;
    self.item2Btn.userInteractionEnabled = YES;
    self.item3Btn.userInteractionEnabled = YES;
    self.item4Btn.userInteractionEnabled = YES;
    
    //赋值
    self.questionLabel.text =[NSString stringWithFormat:@"%@",test.question];
    
    self.item1Label.text = test.item1;
    self.item2Label.text = test.item2;
    self.item3Label.text = test.item3;
    self.item4Label.text = test.item4;

    self.explainLabel.hidden = YES;
    self.detailLabel.text = test.explains;
    self.detailLabel.hidden = YES;
    //判断是否选中
    
        if ([test.checkStr isEqualToString:@"1"]) {
            [self.item1Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            self.item2Btn.userInteractionEnabled = NO;
            self.item3Btn.userInteractionEnabled = NO;
            self.item4Btn.userInteractionEnabled = NO;
        }
        if ([test.checkStr isEqualToString:@"2"]) {
            [self.item2Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            self.item1Btn.userInteractionEnabled = NO;
            self.item3Btn.userInteractionEnabled = NO;
            self.item4Btn.userInteractionEnabled = NO;
        }
        if ([test.checkStr isEqualToString:@"3"]) {
            [self.item3Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            self.item1Btn.userInteractionEnabled = NO;
            self.item2Btn.userInteractionEnabled = NO;
            self.item4Btn.userInteractionEnabled = NO;
        }
        if ([test.checkStr isEqualToString:@"4"]) {
            [self.item4Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            self.item1Btn.userInteractionEnabled = NO;
            self.item2Btn.userInteractionEnabled = NO;
            self.item3Btn.userInteractionEnabled = NO;
        }
   
}
- (IBAction)ChooseAAction:(UIButton *)sender {
    if([sender.imageView.image isEqual:[UIImage imageNamed:@"weixuanzhong"]])
    {
        [self.item1Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
        self.test.checkStr = @"1";
        self.item2Btn.userInteractionEnabled = NO;
        self.item3Btn.userInteractionEnabled = NO;
        self.item4Btn.userInteractionEnabled = NO;
        
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
            
            
            //判断状态
            [self.item1Btn setImage:[UIImage imageNamed:@"cuoti"] forState:(UIControlStateNormal)];
            //判断正确答案
            if ([self.test.answer isEqualToString:@"1"]) {
                [self.item1Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            }
            else if ([self.test.answer isEqualToString:@"2"]) {
                [self.item2Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            }
            else if ([self.test.answer isEqualToString:@"3"]) {
                [self.item3Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            }
            else
            {
                [self.item4Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            }

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
        
       self.test.checkStr = @"";
        self.item2Btn.userInteractionEnabled = YES;
        self.item3Btn.userInteractionEnabled = YES;
        self.item4Btn.userInteractionEnabled = YES;
    }
   }
- (IBAction)ChooseBAction:(UIButton *)sender {
    if([sender.imageView.image isEqual:[UIImage imageNamed:@"weixuanzhong"]])
    {
        [self.item2Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
        self.test.checkStr = @"2";
        self.item1Btn.userInteractionEnabled = NO;
        self.item3Btn.userInteractionEnabled = NO;
        self.item4Btn.userInteractionEnabled = NO;
        
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
            
            //判断状态
            [self.item2Btn setImage:[UIImage imageNamed:@"cuoti"] forState:(UIControlStateNormal)];
            //判断正确答案
            if ([self.test.answer isEqualToString:@"1"]) {
                [self.item1Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            }
            else if ([self.test.answer isEqualToString:@"2"]) {
                [self.item2Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            }
            else if ([self.test.answer isEqualToString:@"3"]) {
                [self.item3Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            }
            else
            {
                [self.item4Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            }

            
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
        [self.item2Btn setImage:[UIImage imageNamed:@"weixuanzhong"] forState:(UIControlStateNormal)];
        
        self.test.checkStr = @"";
        self.item1Btn.userInteractionEnabled = YES;
        self.item3Btn.userInteractionEnabled = YES;
        self.item4Btn.userInteractionEnabled = YES;
    }
    sender.selected = !sender.selected;
}
- (IBAction)ChooseCAction:(UIButton *)sender {
    
    if([sender.imageView.image isEqual:[UIImage imageNamed:@"weixuanzhong"]])
    {
        [self.item3Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
        self.test.checkStr = @"3";
        self.item2Btn.userInteractionEnabled = NO;
        self.item1Btn.userInteractionEnabled = NO;
        self.item4Btn.userInteractionEnabled = NO;
        
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
            
            //判断状态
            [self.item3Btn setImage:[UIImage imageNamed:@"cuoti"] forState:(UIControlStateNormal)];
            //判断正确答案
            if ([self.test.answer isEqualToString:@"1"]) {
                [self.item1Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            }
            else if ([self.test.answer isEqualToString:@"2"]) {
                [self.item2Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            }
            else if ([self.test.answer isEqualToString:@"3"]) {
                [self.item3Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            }
            else
            {
                [self.item4Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            }

            
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
        [self.item3Btn setImage:[UIImage imageNamed:@"weixuanzhong"] forState:(UIControlStateNormal)];
        self.test.checkStr = @"";
        self.item2Btn.userInteractionEnabled = YES;
        self.item1Btn.userInteractionEnabled = YES;
        self.item4Btn.userInteractionEnabled = YES;
        
        
    }
    sender.selected = !sender.selected;
}
- (IBAction)ChooseDAction:(UIButton *)sender {
    if([sender.imageView.image isEqual:[UIImage imageNamed:@"weixuanzhong"]]
       )
    {
        [self.item4Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
        self.test.checkStr = @"4";
        self.item2Btn.userInteractionEnabled = NO;
        self.item3Btn.userInteractionEnabled = NO;
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
            
            //判断状态
            [self.item4Btn setImage:[UIImage imageNamed:@"cuoti"] forState:(UIControlStateNormal)];
            //判断正确答案
            if ([self.test.answer isEqualToString:@"1"]) {
                [self.item1Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            }
            else if ([self.test.answer isEqualToString:@"2"]) {
                [self.item2Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            }
            else if ([self.test.answer isEqualToString:@"3"]) {
                [self.item3Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            }
            else
            {
                [self.item4Btn setImage:[UIImage imageNamed:@"xuanzhong"] forState:(UIControlStateNormal)];
            }

            
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
        [self.item4Btn setImage:[UIImage imageNamed:@"weixuanzhong"] forState:(UIControlStateNormal)];
        self.test.checkStr = @"";
        self.item2Btn.userInteractionEnabled = YES;
        self.item3Btn.userInteractionEnabled = YES;
        self.item1Btn.userInteractionEnabled = YES;
    }
    sender.selected = !sender.selected;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    
}

@end

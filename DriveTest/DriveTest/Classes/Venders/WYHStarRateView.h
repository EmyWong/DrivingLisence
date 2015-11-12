//
//  WYHStarRateView.h
//  Star Rating View
//
//  Created by 王颜华 on 15/9/21.
//  Copyright (c) 2015年 蓝鸥. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WYHStarRateView;

@protocol WYHStarRateViewDelegate <NSObject>

@optional
- (void)starRateView:(WYHStarRateView *)starRateView scorePercentDidChange:(CGFloat)newScorePercent;

@end


@interface WYHStarRateView : UIView

@property(nonatomic,assign)CGFloat scorePercent;//得分值，范围为0-10.默认为10
@property(nonatomic,assign)BOOL hasAnimation;//是否允许动画，默认为NO；
@property(nonatomic,assign)BOOL allowIncompleteStar;//评分时是否允许不是整星，默认为NO

@property(nonatomic,weak)id<WYHStarRateViewDelegate> delegate;

-(instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars;
@end

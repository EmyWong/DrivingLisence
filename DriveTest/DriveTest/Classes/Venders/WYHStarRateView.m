//
//  WYHStarRateView.m
//  Star Rating View
//
//  Created by 王颜华 on 15/9/21.
//  Copyright (c) 2015年 蓝鸥. All rights reserved.
//

#import "WYHStarRateView.h"

#define FOREGROUND_STAR_IMAGE_NAME @"b27_icon_star_yellow"
#define BACKGROUND_STAR_IMAGE_NAME @"b27_icon_star_gray"
#define DEFAULT_STAR_NUMBER 5
#define ANIMATION_TIME_INTERVAL 0.2


@interface WYHStarRateView()

@property(nonatomic,strong)UIView *foregroundStarView;
@property(nonatomic,strong)UIView *backgroundStarView;

@property(nonatomic,assign)NSInteger numberOfStars;

@end
@implementation WYHStarRateView

//初始化方法
-(instancetype)init
{
    NSAssert(NO, @"You should never call this method in this class. Use initWithFrame: instead!");
    return nil;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame numberOfStars:DEFAULT_STAR_NUMBER];
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self=[super initWithCoder:aDecoder]) {
        _numberOfStars=DEFAULT_STAR_NUMBER;
        [self buildDataAndUI];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars
{
    if (self=[super initWithFrame:frame]) {
        _numberOfStars=DEFAULT_STAR_NUMBER;
        [self buildDataAndUI];
    }
    return self;
}
//私有方法
-(void)buildDataAndUI
{
    _scorePercent=1;
    _hasAnimation=NO;
    _allowIncompleteStar=YES;
    
    self.foregroundStarView=[self createStarViewWithImage:FOREGROUND_STAR_IMAGE_NAME];
    self.backgroundStarView=[self createStarViewWithImage:BACKGROUND_STAR_IMAGE_NAME];
    
    [self addSubview:self.backgroundStarView];
    [self addSubview:self.foregroundStarView];
    
//    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userTapRateView:)];
//    tapGesture.numberOfTapsRequired = 1;
//    [self addGestureRecognizer:tapGesture];
}

//-(void)userTapRateView:(UITapGestureRecognizer *)sender
//{
//    CGPoint tapPoint = [sender locationInView:self];
//    CGFloat offset = tapPoint.x;
//    CGFloat realStarScore = offset / (self.bounds.size.width / self.numberOfStars);
//    CGFloat starScore = self.allowIncompleteStar ? realStarScore : ceilf(realStarScore);
//    self.scorePercent = starScore / self.numberOfStars;
//}
-(UIView *)createStarViewWithImage:(NSString *)imageName
{
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    view.clipsToBounds = YES;
    view.backgroundColor = [UIColor clearColor];
    for (NSInteger i = 0; i < self.numberOfStars; i ++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(i * self.bounds.size.width / self.numberOfStars, 0, self.bounds.size.width / self.numberOfStars, self.bounds.size.height);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [view addSubview:imageView];
    }
    return view;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    __weak WYHStarRateView *weakSelf = self;
    CGFloat animationTimeInterval = self.hasAnimation ? ANIMATION_TIME_INTERVAL : 0;
    [UIView animateWithDuration:animationTimeInterval animations:^{
        weakSelf.foregroundStarView.frame = CGRectMake(0, 0, weakSelf.bounds.size.width * weakSelf.scorePercent, weakSelf.bounds.size.height);
    }];
}
//get和set方法
- (void)setScorePercent:(CGFloat)scroePercent {
    if (_scorePercent == scroePercent) {
        return;
    }
    
    if (scroePercent < 0) {
        _scorePercent = 0;
    } else if (scroePercent > 1) {
        _scorePercent = 1;
    } else {
        _scorePercent = scroePercent;
    }
    
    if ([self.delegate respondsToSelector:@selector(starRateView:scorePercentDidChange:)]) {
        [self.delegate starRateView:self scorePercentDidChange:scroePercent];
    }
    
    [self setNeedsLayout];
}


@end

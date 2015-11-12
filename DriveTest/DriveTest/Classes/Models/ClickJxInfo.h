//
//  ClickJxInfo.h
//  DrivingSchoolDemo
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 Mr Tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClickJxInfo : NSObject
@property (nonatomic,strong)NSDictionary* baseinfoarea;//驾校地址： baseinfoarea字典（电话，地址，班车路线）baseinfoarea教练电话 baseinfoarea陪练电话
@property (nonatomic,strong)NSDictionary* bbsgrouparea;//公交驾校： bbsgrouparea字典（驾友讨论 ，只显示七个驾友头像）
@property (nonatomic,strong)NSDictionary* commentarea;//学员点评：commentarea 字典
@property (nonatomic,strong)NSDictionary* descarea;//驾校简介：descarea字典（内含 驾校特色，驾校新闻，更多） descarea教练简介  descarea陪练简介
@property (nonatomic,strong)NSDictionary* questionarea;//学车问答： questionarea字典
@property (nonatomic,strong)NSDictionary* signuparea;//报名学员：signuparea字典（没有交互事件）点评按钮：直接跳转至学员点评问答按钮：跳转至学员问答 报名按钮：组一个假页面实现报名即可
@property (nonatomic,strong)NSDictionary* titlearea;//驾校联系方式： titlearea字典（驾校照片numbers，驾校名，费用，关注人数，等级，）驾校地址： baseinfoarea字典（电话，地址，班车路线）

@end

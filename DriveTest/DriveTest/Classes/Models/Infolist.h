//
//  Infolist.h
//  DrivingSchoolDemo
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 Mr Tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Infolist : NSObject
@property (nonatomic,strong)NSDictionary* action; //详情
@property (nonatomic,copy)NSString* amount;//价钱
@property (nonatomic,copy)NSString* attentionnum;//关注量
@property (nonatomic,copy)NSString* ifauthen;//
@property (nonatomic,copy)NSString* ifpay;//
@property (nonatomic,copy)NSString* infoid;//编号(后面要用到)
@property (nonatomic,copy)NSString* name; //驾校名字
@property (nonatomic,copy)NSString* picurl;//驾校图片
@property (nonatomic,assign)CGFloat score;//评分






@end

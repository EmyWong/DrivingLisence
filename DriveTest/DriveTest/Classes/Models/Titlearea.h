//
//  Titlearea.h
//  DriveTest
//
//  Created by lanou3g on 15/11/11.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Titlearea : NSObject
@property (nonatomic,strong)NSDictionary* action; //详情
@property (nonatomic,copy)NSString* amount;//价钱
@property (nonatomic,copy)NSString* attentionnum;//关注量
@property (nonatomic,copy)NSString* ifauthen;
@property (nonatomic,assign)NSInteger imagecount;
@property (nonatomic,copy)NSString* name; //驾校名字
@property (nonatomic,copy)NSString* imageurl;//驾校图片
@property (nonatomic,copy)NSString* priceunit;
@property (nonatomic,assign)CGFloat star;//评分
@property (nonatomic,copy)NSString* title;
@property (nonatomic,copy)NSString* memo;
@end

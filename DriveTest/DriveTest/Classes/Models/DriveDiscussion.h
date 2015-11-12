//
//  DriveDiscussion.h
//  DriveTest
//
//  Created by lanou3g on 15/11/12.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DriveDiscussion : NSObject
@property (nonatomic,strong)NSDictionary* commentaction;
@property (nonatomic,copy)NSString* commenttip;
@property (nonatomic,copy)NSString* content;
@property (nonatomic,assign)NSInteger createtime;
@property (nonatomic,strong)NSDictionary* detailaction;
@property (nonatomic,copy)NSString* face;
@property (nonatomic,copy)NSString* group;
@property (nonatomic,strong)NSDictionary* groupaction;
@property (nonatomic,strong)NSArray* groups;
@property (nonatomic,strong)NSArray* imageurl;
@property (nonatomic,assign)NSInteger infoid;
@property (nonatomic,assign)NSInteger isclosed;
@property (nonatomic,assign)NSInteger isdeleted;
@property (nonatomic,assign)NSInteger isessential;
@property (nonatomic,assign)NSInteger istoped;
@property (nonatomic,copy)NSString* liketip;
@property (nonatomic,copy)NSString* local;
@property (nonatomic,copy)NSString* nickname;
@property (nonatomic,copy)NSString* postdate;
@property (nonatomic,assign)NSInteger praised;
@property (nonatomic,strong)NSDictionary* useraction;
@property (nonatomic,assign)CGFloat userid;







@end

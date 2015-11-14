//
//  ListHelper.h
//  DriveTest
//
//  Created by lanou3g on 15/11/14.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListHelper : NSObject
@property (nonatomic,copy)NSString* backupurl;
@property (nonatomic,strong)NSArray* infolist;
@property (nonatomic,copy)NSString* lastpage;
@property (nonatomic,assign)NSInteger pageindex;
@property (nonatomic,assign)NSInteger pagesize;
@property (nonatomic,assign)NSInteger totalinfocount;
@property (nonatomic,assign)NSInteger totalusercount;


@end

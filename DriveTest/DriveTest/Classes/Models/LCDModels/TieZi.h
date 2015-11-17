//
//  TieZi.h
//  DriveTest
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "AVObject.h"

@interface TieZi : AVObject<AVSubclassing>

@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong) NSArray *imgArr;
@property (nonatomic, copy) NSString *whereAdd;

@end

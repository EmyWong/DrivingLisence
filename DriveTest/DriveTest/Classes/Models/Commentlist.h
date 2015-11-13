//
//  Commentlist.h
//  DriveTest
//
//  Created by lanou3g on 15/11/13.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Commentlist : NSObject
@property (nonatomic,copy)NSString* comment;
@property (nonatomic,assign)CGFloat commentid;
@property (nonatomic,assign)NSInteger likecount;
@property (nonatomic,copy)NSString* name;
@property (nonatomic,assign)NSInteger score;
@property (nonatomic,copy)NSString* time;
@property (nonatomic,copy)NSString* face;


@end

//
//  TestResult.h
//  JiakaoDemo
//
//  Created by 王颜华 on 15/11/9.
//  Copyright © 2015年 王颜华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestResult : NSObject

@property (nonatomic,assign) NSInteger testID;
@property (nonatomic,strong) NSString *question;
@property (nonatomic,strong) NSString *answer;
@property (nonatomic,strong) NSString *item1;
@property (nonatomic,strong) NSString *item2;
@property (nonatomic,strong) NSString *item3;
@property (nonatomic,strong) NSString *item4;
@property (nonatomic,strong) NSString *explains;
@property (nonatomic,strong) NSString *url;


@property (nonatomic,strong) NSString *checkStr;

@end

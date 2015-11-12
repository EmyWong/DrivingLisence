//
//  TestHelper.h
//  JiakaoDemo
//
//  Created by 王颜华 on 15/11/9.
//  Copyright © 2015年 王颜华. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TestResult;
@interface TestHelper : NSObject
@property (nonatomic,strong) NSMutableArray *CuoTiArr;
@property (nonatomic,strong) NSMutableArray *allTestResultArray;

+ (instancetype)sharedHelper;

- (void)loadData:(void(^)(void))completeHandle webURL:(NSString *)weburl;

- (NSInteger)numberOfData;

- (TestResult *)modelAtIndex:(NSInteger)index;

- (void)addCuoti:(TestResult *)test;

@end

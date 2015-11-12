//
//  TestHelper.m
//  JiakaoDemo
//
//  Created by 王颜华 on 15/11/9.
//  Copyright © 2015年 王颜华. All rights reserved.
//

#import "TestHelper.h"

@interface TestHelper ()



@end
@implementation TestHelper

+ (instancetype)sharedHelper {
    static TestHelper *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [self new];
    });
    return helper;
}

- (void)loadData:(void (^)(void))completeHandle webURL:(NSString *)weburl {
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:weburl]] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        NSMutableDictionary *test_dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSMutableArray *test_arr = test_dict[@"result"];
        self.allTestResultArray = [NSMutableArray arrayWithCapacity:100];
        for (NSDictionary  *dic in test_arr) {
            TestResult *result = [TestResult new];
            [result setValuesForKeysWithDictionary:dic];
            [self.allTestResultArray addObject:result];
        }
        //回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            completeHandle();
        });
        
    }];
    
    [task resume];
}


- (NSInteger)numberOfData {
    return self.allTestResultArray.count;
}

- (TestResult *)modelAtIndex:(NSInteger)index {
    return self.allTestResultArray[index];
}
- (NSMutableArray *)CuoTiArr
{
    if (!_CuoTiArr) {
        self.CuoTiArr = [NSMutableArray array];
    }
    return _CuoTiArr;
}

- (void)addCuoti:(TestResult *)test
{
    [self.CuoTiArr addObject:test];
}
@end

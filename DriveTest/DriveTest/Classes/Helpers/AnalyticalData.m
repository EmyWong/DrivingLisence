//
//  AnalyticalData.m
//  DrivingSchoolDemo
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 Mr Tang. All rights reserved.
//

#import "AnalyticalData.h"

@interface AnalyticalData()
@property (nonatomic,strong)NSMutableArray * allDataArray;
@end
@implementation AnalyticalData
//单例
+ (instancetype)sharedIntance {
    static AnalyticalData * intance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        intance = [AnalyticalData new];
    });
    return intance;
}
//搜索驾校
- (void)searchSchoolDataWithCityid:(NSString *)cityid option:(Block)block {
    //创建一个可变数组，用来接受数据
    self.allDataArray = [NSMutableArray array];
    NSString * url = [kSearchSchoolUrl stringByAppendingString:cityid];
    //网络数据请求
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //测试是否有网络连接
        if ([[NetWorkManager sharedWithManager] isConnectionAvailable]== NO) {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"无网络连接" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else
        {
        //字典接收data数据
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        //
        for (NSDictionary * dic in dict[@"school"]) {
            School * school = [School new];
            [school setValuesForKeysWithDictionary:dic];
            [self.allDataArray addObject:school];
        }
        }
        //block传值
        block(self.allDataArray);
    }];

}

//不排序：  按照价格排序（从低到高）  按照人气排序后（从高到低）  按照人气排序后（从高到低）  （驾校 type=jx， 教练 type=jl， 陪练 type=pl）
- (void)searchInfolistDataWithStr:(NSString *)str type:(NSString *)type pageindex:(NSString *)pageindex cityid:(NSString *)cityid option:(Block)block{
    //创建一个可变数组，用来接受数据
    self.allDataArray = [NSMutableArray array];
    //接口拼接
    pageindex = [pageindex stringByAppendingString:@"&type="];
    pageindex = [pageindex stringByAppendingString:type];
    pageindex = [pageindex stringByAppendingString:@"&cityid="];
    pageindex = [pageindex stringByAppendingString:cityid];
    NSString * url = nil;
    if (str == nil) {
        url = [kSearchInfoListUrl stringByAppendingString:pageindex];
    }else if([str isEqualToString:@"price"]) {
        url = [kSearchInfoListUrlByPrice stringByAppendingString:pageindex];
    }else if([str isEqualToString:@"renqi"]) {
        url = [kSearchInfoListUrlByRenQi stringByAppendingString:pageindex];
    }else if([str isEqualToString:@"koubei"])  {
        url = [kSearchInfoListUrlByKouBei stringByAppendingString:pageindex];
    }else {
        return;
    }
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    //网络数据请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //测试是否有网络连接
        if ([[NetWorkManager sharedWithManager] isConnectionAvailable]== NO) {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"无网络连接" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else
        {
        //字典接收data数据
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSDictionary * resultDict = dict[@"result"];
        NSDictionary * jxDict = resultDict[type];
        for (NSDictionary * dic in jxDict[@"infolist"]) {
            Infolist * infolist = [Infolist new];
            [infolist setValuesForKeysWithDictionary:dic];
            [self.allDataArray addObject:infolist];
        }
        }
        //block传值
        block(self.allDataArray);
        
    }];

}

//点击驾校,点击教练,点击陪练
- (void)clickLoadDataWithInfoid:(NSString *)infoid type:(NSString *)type option:(Block)block{
    //创建一个可变数据，用来接受数据
    self.allDataArray = [NSMutableArray array];
    //网址字符串拼接
    NSString * url = [@"http://api.jxedt.com/detail/"stringByAppendingString:infoid];
    url = [url stringByAppendingString:@"/?format=json&type="];
    url = [url stringByAppendingString:type];
    //网络数据请求
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //测试是否有网络连接
        if ([[NetWorkManager sharedWithManager] isConnectionAvailable]== NO) {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"无网络连接" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else
        {
        //字典接收data数据
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        //MVC
        NSDictionary * resultDict = dict[@"result"];
        NSDictionary * infoDict = resultDict[@"info"];
        ClickJxInfo * click = [ClickJxInfo new];
        [click setValuesForKeysWithDictionary:infoDict];
        [self.allDataArray addObject:click];
        }
        //block传值
        block(self.allDataArray);
    }];

}

//点击讨论详情页面的方法
- (void)driveDiscussionLoadDataWithInfoid:(NSString*)infoid
                                pageindex:(NSString*)pageindex
                                   option:(Block) block{
    //测试是否有网络连接
    if ([[NetWorkManager sharedWithManager] isConnectionAvailable]== NO) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"无网络连接" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else
    {
        //创建一个可变数据，用来接受数据
        self.allDataArray = [NSMutableArray array];
        //网络数据请求
        NSString * url = [NSString stringWithFormat:@"http://bbs.api.jxedt.com/listcate/%@/?createtime=0&pageindex=%@",infoid,pageindex];
        NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
            //字典接收data数据
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSDictionary * resultDict = dict[@"result"];
            NSDictionary * listDict = resultDict[@"list"];
            for (NSDictionary * dic  in listDict[@"infolist"]) {
                DriveDiscussion * driveDiscussion = [DriveDiscussion new];
                [driveDiscussion setValuesForKeysWithDictionary:dic];
                [self.allDataArray addObject:driveDiscussion];
            }
            block(self.allDataArray);
        }];
        
    }
}


@end

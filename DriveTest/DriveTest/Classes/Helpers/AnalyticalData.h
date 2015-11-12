//
//  AnalyticalData.h
//  DrivingSchoolDemo
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 Mr Tang. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^Block) (NSArray* array);
@interface AnalyticalData : NSObject
+ (instancetype)sharedIntance;
//搜索驾校   cityid 指的是城市的ID  北京为 1 (必须填)
- (void)searchSchoolDataWithCityid:(NSString*)cityid
                            option:(Block)block;
//第一个参数str传入@"price" @"renqi" @"koubei"  第二个参数type（驾校 type=jx， 教练 type=jl， 陪练 type=pl） 第三个参数pageindex=？ 这个从1开始（用于拉动刷新） cityid 指的是城市的ID  北京为 1 (必须填)
- (void)searchInfolistDataWithStr:(NSString*)str
                             type:(NSString*)type
                        pageindex:(NSString*)pageindex
                           cityid:(NSString*)cityid
                           option:(Block)block;
//点击驾校,点击教练,点击陪练,infoid就是模型（Infolist）中的 infoid = ？（驾校 type=jx， 教练 type=jl， 陪练 type=pl）
- (void)clickLoadDataWithInfoid:(NSString*)infoid
                           type:(NSString*)type
                         option:(Block)block;

//点击讨论详情页面的方法
- (void)driveDiscussionLoadDataWithInfoid:(NSString*)infoid
                                pageindex:(NSString*)pageindex
                                   option:(Block)block;
@end

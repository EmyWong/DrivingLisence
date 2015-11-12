//
//  URLs.h
//  DriveTest
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#ifndef URLs_h
#define URLs_h

//城市id默认选择是1，显示北京市；下边的数据都是以北京市为基础展开的。
#define kSearchSchoolUrl @"http://www.jxedt.com/api/mobile/jx.asp?cityid="


//驾校，教练，陪练,这4个接口分别是不排序的，按价格排序的，按人气排序的，按口碑排序的 此外，该接口的一个参数需要拼接（驾校 type=jx， 教练 type=jl， 陪练 type=pl）

#define kSearchInfoListUrl @"http://api.jxedt.com/list/?channel=80000&version=3.7.5&os=ios&filterparams=%7B%22filtercityid%22:%221%22%7D&pageindex="//不排序
#define kSearchInfoListUrlByPrice @"http://api.jxedt.com/list/?channel=80000&version=3.7.5&os=ios&productid=3&filterparams=%7B%22price%22:%22asc%22,%22filtercityid%22:%221%22%7D&pageindex="//按价格排序
#define kSearchInfoListUrlByRenQi @"http://api.jxedt.com/list/?channel=80000&version=3.7.5&os=ios&productid=3&filterparams=%7B%22renqi%22:%22desc%22,%22filtercityid%22:%221%22%7D&pageindex="//按人气排序
#define kSearchInfoListUrlByKouBei @"http://api.jxedt.com/list/?channel=80000&version=3.7.5&os=ios&productid=3&filterparams=%7B%22koubei%22:%22desc%22,%22filtercityid%22:%221%22%7D&pageindex="//按口碑排序


//c1.随机/顺序 练习
#define c1randUrl @"http://api2.juheapi.com/jztk/query?subject=1&model=c1&key=46d9fa5dc8f6ae47b124decceca269ee&testType=rand"
#define c1orderUrl @"http://api2.juheapi.com/jztk/query?subject=1&model=c1&key=46d9fa5dc8f6ae47b124decceca269ee&testType=order"
#define c1k4randUrl @"http://api2.juheapi.com/jztk/query?subject=4&model=c1&key=46d9fa5dc8f6ae47b124decceca269ee&testType=rand"
#define c1k4orderUrl @"http://api2.juheapi.com/jztk/query?subject=4&model=c1&key=46d9fa5dc8f6ae47b124decceca269ee&testType=order"
//*****************************
//题考->驾校->评论 图片
#define kJxcommentUrl @"http://api.jxedt.com/detail/122/photo/list?type=jx"

//科目一/四 考试技巧
#define k1testmethod @"http://bbs.api.jxedt.com/news/h5/204/index"
#define k4testmethod @"http://bbs.api.jxedt.com/news/h5/207/index"

//驾考法规
#define testRule1 @"http://bbs.api.jxedt.com/news/h5/detail/203/38385424601088"
#define testRule2 @"http://bbs.api.jxedt.com/news/h5/detail/203/44256695226368"
#define testRule3 @"http://bbs.api.jxedt.com/news/h5/detail/203/42307610513408"
#define testRule4 @"http://bbs.api.jxedt.com/news/h5/detail/203/44614783897600"

//科目二/三 秘籍指导
#define k2testmethod @"http://bbs.api.jxedt.com/news/h5/205/index"
#define k3testmethod @"http://bbs.api.jxedt.com/news/h5/206/index"

//驾照年审年检
#define lisenceUrl1 @"http://bbs.api.jxedt.com/news/h5/detail/208/276041156825088"
//驾照换证
#define lisenceUrl2 @"http://bbs.api.jxedt.com/news/h5/detail/208/276894676729856"
//驾照遗失
#define lisenceUrl3 @"http://bbs.api.jxedt.com/news/h5/detail/208/290785599197184"
//驾照挂失
#define lisenceUrl4 @"http://bbs.api.jxedt.com/news/h5/detail/208/304656514859008"
//车辆操作大全
#define methodUrl1 @"http://bbs.api.jxedt.com/news/h5/detail/209/307387392638976"
//特殊天气驾驶技巧
#define methodUrl2 @"http://bbs.api.jxedt.com/news/h5/detail/209/308758321860608"
//夜间行驶必备技巧
#define methodUrl3 @"http://bbs.api.jxedt.com/news/h5/detail/209/309361810915328"
//刹车技巧
#define methodUrl4 @"http://bbs.api.jxedt.com/news/h5/detail/209/310584651857920"
//事故处理技巧
#define methodUrl5 @"http://bbs.api.jxedt.com/news/h5/210/index"
//必备停车技巧
#define methodUrl6 @"http://bbs.api.jxedt.com/news/h5/detail/209/626775719186432"








#pragma mark 考试技巧webView ，url

#define kTestSkills @"http://bbs.api.jxedt.com/news/h5/204/index";

#endif /* URLs_h */

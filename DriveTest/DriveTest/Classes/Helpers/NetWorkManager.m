//
//  NetWorkManager.m
//  SuitCase
//
//  Created by 王颜华 on 15/11/1.
//  Copyright © 2015年 王颜华. All rights reserved.
//

#import "NetWorkManager.h"
#import <SystemConfiguration/SystemConfiguration.h>
@implementation NetWorkManager
+ (instancetype)sharedWithManager
{
    static NetWorkManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [NetWorkManager new];
    });
    return manager;
}
- (BOOL) isConnectionAvailable
{
    SCNetworkReachabilityFlags flags;
    BOOL receivedFlags;
    
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(CFAllocatorGetDefault(), [@"dipinkrishna.com" UTF8String]);
    receivedFlags = SCNetworkReachabilityGetFlags(reachability, &flags);
    CFRelease(reachability);
    if (!receivedFlags || (flags == 0) )
    {
        return FALSE;
    } else {
        return TRUE;
    }
}

@end

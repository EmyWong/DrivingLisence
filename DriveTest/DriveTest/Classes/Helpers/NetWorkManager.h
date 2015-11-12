//
//  NetWorkManager.h
//  SuitCase
//
//  Created by 王颜华 on 15/11/1.
//  Copyright © 2015年 王颜华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkManager : NSObject
+ (instancetype)sharedWithManager;
- (BOOL) isConnectionAvailable;
@end

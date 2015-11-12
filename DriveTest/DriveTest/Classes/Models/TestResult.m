//
//  TestResult.m
//  JiakaoDemo
//
//  Created by 王颜华 on 15/11/9.
//  Copyright © 2015年 王颜华. All rights reserved.
//

#import "TestResult.h"

@implementation TestResult

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        self.testID = (NSInteger)value;
    }
}



@end

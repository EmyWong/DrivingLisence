//
//  School.m
//  DrivingSchoolDemo
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 Mr Tang. All rights reserved.
//

#import "School.h"

@implementation School
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        self.schoolId = value;
    }
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", _name];
}
@end

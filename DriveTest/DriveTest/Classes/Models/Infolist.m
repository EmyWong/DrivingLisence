//
//  Infolist.m
//  DrivingSchoolDemo
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 Mr Tang. All rights reserved.
//

#import "Infolist.h"

@implementation Infolist

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@", _name,_amount];
}


@end

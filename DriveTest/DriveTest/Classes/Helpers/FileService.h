//
//  FileService.h
//  SuitCase
//
//  Created by 王颜华 on 15/10/26.
//  Copyright © 2015年 王颜华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileService : NSObject
+(float)fileSizeAtPath:(NSString *)path;

+(float)folderSizeAtPath:(NSString *)path;

+(void)clearCache:(NSString *)path;

@end

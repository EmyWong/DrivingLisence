//
//  RegisterViewController.h
//  DriveTest
//
//  Created by jinke on 15/11/11.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ValueBlock)(NSString *name,NSString *pwd);

@interface RegisterViewController : UIViewController

@property (nonatomic,copy) ValueBlock valueBlock;

@end

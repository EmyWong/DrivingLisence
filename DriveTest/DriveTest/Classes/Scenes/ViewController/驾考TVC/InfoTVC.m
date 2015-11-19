//
//  InfoTVC.m
//  DriveTest
//
//  Created by 王颜华 on 15/11/17.
//  Copyright © 2015年 第一小组. All rights reserved.
//

#import "InfoTVC.h"
#import "InfoTableViewCell.h"
#import "Info2TableViewCell.h"
#import "PrintViewController.h"
@interface InfoTVC ()<UIImagePickerControllerDelegate,UIActionSheetDelegate,UINavigationControllerDelegate>

@end

@implementation InfoTVC
- (void)viewWillAppear:(BOOL)animated
{
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"iconimage"]) {
        self.cell.IconImage.image = [UIImage imageWithData:[[NSUserDefaults standardUserDefaults]objectForKey:@"iconimage"]];
    }
    else
    {
        self.cell.IconImage.image = [UIImage imageNamed:@"touxiang.jpg"];
    }
    if ([[NSUserDefaults standardUserDefaults]valueForKey:@"nickname"]) {
        self.cell.userName.text = [[NSUserDefaults standardUserDefaults]valueForKey:@"nickname"];
        self.cell1.detailLabel2.text = [[NSUserDefaults standardUserDefaults]valueForKey:@"nickname"];
    }
    else
    {
        self.cell.userName.text = @"未设置昵称";
        self.cell1.detailLabel2.text = @"未设置";
    }
    
    if ([[NSUserDefaults standardUserDefaults]valueForKey:@"accountnumber"]) {
        self.cell.accountNumber.text = [[NSUserDefaults standardUserDefaults]valueForKey:@"accountnumber"];
    }
    else
    {
        self.cell.accountNumber.text = @"xiaochezhushou";
    }
    if ([[NSUserDefaults standardUserDefaults]valueForKey:@"sex"]) {
        self.cell2.detailLabel2.text = [[NSUserDefaults standardUserDefaults]valueForKey:@"sex"];
    }
    else
    {
        self.cell2.detailLabel2.text = @"未设置";
    }
    if ([[NSUserDefaults standardUserDefaults]valueForKey:@"sign"]) {
        self.cell3.detailLabel2.text = [[NSUserDefaults standardUserDefaults]valueForKey:@"sign"];
    }
    else
    {
        self.cell3.detailLabel2.text = @"未设置";
    }

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"Info2TableViewCell" bundle:nil] forCellReuseIdentifier:@"info2cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"InfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"infocell"];
    
    
    self.tableView.scrollEnabled = YES;

    self.tableView.tableFooterView = ({
        UIView *view = [[UIView alloc] init];
        view;
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 10;
    }
    return 0;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    else
    {
        return 3;
    }

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( indexPath.section == 0 && indexPath.row == 0) {
        return 100;
    }
    else
    {
        return 50;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 ) {
        self.cell = [tableView dequeueReusableCellWithIdentifier:@"infocell" forIndexPath:indexPath];
        _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return _cell;
        
    }
    else
    {
        if (indexPath.row == 0) {
            self.cell1 = [tableView dequeueReusableCellWithIdentifier:@"info2cell" forIndexPath:indexPath];
            _cell1.textLabel2.text = @"昵称";
            _cell1.detailLabel2.text = @"未设置";
            _cell1.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return _cell1;
        }
        else if (indexPath.row == 1)
        {
            self.cell2 = [tableView dequeueReusableCellWithIdentifier:@"info2cell" forIndexPath:indexPath];
            _cell2.textLabel2.text = @"性别";
            _cell2.detailLabel2.text = @"未设置";
            _cell2.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return _cell2;
        }
        else
        {
        self.cell3 = [tableView dequeueReusableCellWithIdentifier:@"info2cell" forIndexPath:indexPath];
        _cell3.textLabel2.text = @"签名";
        _cell3.detailLabel2.text = @"未设置";
        _cell3.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return _cell3;
        }
    }
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"选择照片", nil];
        [actionSheet showInView:self.view];
    }
    else
    {
        if (indexPath.row == 0) {
            PrintViewController *printVC = [[PrintViewController alloc]init];
            printVC.title = @"昵称";
            
            printVC.passvalue = ^(NSString * value)
            {
                self.cell1.detailLabel2.text = value;
                [[NSUserDefaults standardUserDefaults]setValue:value forKey:@"nickname"];
            };
            
            [self.navigationController pushViewController:printVC animated:YES];
        }
        else if (indexPath.row == 1)
        {
            UIAlertController *ac = [[UIAlertController alloc]init];
            ac.view.frame = self.view.bounds;
            UIAlertAction * a1 = [UIAlertAction actionWithTitle:@"男" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
               
                self.cell2.detailLabel2.text = @"男";
                [[NSUserDefaults standardUserDefaults]setValue:@"男" forKey:@"sex"];
            }];
            UIAlertAction * a2 = [UIAlertAction actionWithTitle:@"女" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                
                self.cell2.detailLabel2.text = @"女";
                [[NSUserDefaults standardUserDefaults]setValue:@"女" forKey:@"sex"];
            }];
            UIAlertAction * a3 = [UIAlertAction actionWithTitle:@"其他" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                
                self.cell2.detailLabel2.text = @"未知";
                [[NSUserDefaults standardUserDefaults]setValue:@"未知" forKey:@"sex"];
            }];
            UIAlertAction *a4 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];
            
            [ac addAction:a1];
            [ac addAction:a2];
            [ac addAction:a3];
            [ac addAction:a4];
            
            
            [self presentViewController:ac animated:YES completion:nil];
        }
        else
        {
            PrintViewController *printVC = [[PrintViewController alloc]init];
            printVC.title = @"签名";
            printVC.passvalue = ^(NSString * value)
            {
                self.cell3.detailLabel2.text = value;
                [[NSUserDefaults standardUserDefaults]setValue:value forKey:@"sign"];
            };
            [self.navigationController pushViewController:printVC animated:YES];
        }
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
//抓取照片的协议方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    self.cell.IconImage.image = image;
    self.passimage(image);
    
    //保存头像
    NSData *imageData = UIImageJPEGRepresentation(image, 100);
    [[NSUserDefaults standardUserDefaults]setObject:imageData forKey:@"iconimage"];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    [[picker parentViewController]dismissViewControllerAnimated:YES completion:nil];
}
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.allowsImageEditing = YES;
    
    if (buttonIndex == 0) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"没有相机" message:nil delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:nil];
            [alert show];
        }
    }
    else if (buttonIndex == 1)
    {
        imagePicker.delegate = self;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
    
}



@end

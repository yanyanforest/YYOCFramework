//
//  CYUIAlertView.m
//  KHMall
//
//  Created by 198 on 16/6/16.
//  Copyright © 2016年 198. All rights reserved.
//

#import "CYUIAlertView.h"
@interface CYUIAlertView()<UIAlertViewDelegate,UIPopoverControllerDelegate,UIActionSheetDelegate>
{
    UIAlertView *alertview;
    UIAlertController *alertController;
    UIActionSheet *actionsheet;
}
@end
@implementation CYUIAlertView
-(CYUIAlertView *)initWithAlertViewTitle:(NSString *)title message:(NSString *)msg cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles,...
{
    self = [super init];
    
    if (self) {
        va_list otherButtonList;
        NSString *otherTitleStr = nil;
        NSMutableArray *argArr = [NSMutableArray array];
        //在使用前要先用va_start(list, last_param)对list进行初始化，last_param为最右边的已知参数，表示list从last_param的下一个参数开始
        va_start(otherButtonList, otherButtonTitles);
        if (otherButtonTitles != nil) {
            [argArr addObject:otherButtonTitles];
            while ((otherTitleStr = va_arg(otherButtonList, id))) {
                [argArr addObject:otherTitleStr];
            }
        }
        
        va_end(otherButtonList);
        
        if([CYHelp_base systemVersionGreaterThanIOS7]){
            alertController = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){
                if (self.block_cancel) {
                    self.block_cancel();
                    return;
                }
                if (self.block_clickIndex) {
                    self.block_clickIndex(0);
                }
            }];
            [alertController addAction:cancelAction];
            for (NSInteger i = 0; i<argArr.count; i++) {
                NSString *otherTitle = argArr[i];
                UIAlertAction *action = [UIAlertAction actionWithTitle:otherTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    if (self.block_clickIndex) {
                        self.block_clickIndex(i+1);
                    }
                }];
                [alertController addAction:action];
            }
        }else{
           UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:title message:msg delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:CFBridgingRelease(otherButtonList), nil];
            alertview = alertView;
        }
        
    }
    return self;
}
-(CYUIAlertView *)initWithActionSheetTitle:(NSString *)title message:(NSString *)msg cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles,...
{
    self = [super init];
    
    if (self) {
        va_list otherButtonList;
        NSString *otherTitleStr = nil;
        NSMutableArray *argArr = [NSMutableArray array];
        //在使用前要先用va_start(list, last_param)对list进行初始化，last_param为最右边的已知参数，表示list从last_param的下一个参数开始
        va_start(otherButtonList, otherButtonTitles);
        if (otherButtonTitles) {
            [argArr addObject:otherButtonTitles];

        while ((otherTitleStr = va_arg(otherButtonList, id))) {
            [argArr addObject:otherTitleStr];
        }
            
        }
        va_end(otherButtonList);
        
        if([CYHelp_base systemVersionGreaterThanIOS7]){
            alertController = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleActionSheet];
            if (cancelButtonTitle) {
                UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){
                    if (self.block_cancel) {
                        self.block_cancel();
                        return;
                    }
                    
                }];
                [alertController addAction:cancelAction];
                
            }
            if (destructiveButtonTitle) {
                UIAlertAction *destructiveButton = [UIAlertAction actionWithTitle:destructiveButtonTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action){
                    if (self.block_destruct) {
                        self.block_destruct();
                        return;
                    }
                   
                }];
                [alertController addAction:destructiveButton];
            }
            for (int i = 0; i<argArr.count; i++) {
                NSString *otherTitle = argArr[i];
                UIAlertAction *action = [UIAlertAction actionWithTitle:otherTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    if (self.block_clickIndex) {
                        self.block_clickIndex(i);
                    }
                }];
                [alertController addAction:action];
            }
        }else{
//            actionsheet = [[UIActionSheet alloc]initWithTitle:title delegate:self cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:CFBridgingRelease(otherButtonList), nil];
            actionsheet = [[UIActionSheet alloc]initWithTitle:title delegate:self cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:nil];
        for (int i=0 ; i<argArr.count; i++) {
            [actionsheet addButtonWithTitle:argArr[i]];
        }

        }
    
    }
    return self;
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == alertView.cancelButtonIndex) {
        if (self.block_cancel) {
            self.block_cancel();
            return;
        }
    }
    if (self.block_clickIndex) {
        self.block_clickIndex(buttonIndex);
    }
}
-(void) showActionSheetInViewController:(UIViewController*)vc{
    if ([CYHelp_base systemVersionGreaterThanIOS7]) {
        [vc presentViewController:alertController animated:YES completion:nil];
    }else{
        [actionsheet showInView:vc.view];
    }
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == actionSheet.cancelButtonIndex) {
        if (self.block_cancel) {
            self.block_cancel();
        }
        return;
    }
    if (buttonIndex == actionSheet.destructiveButtonIndex) {
        if (self.block_destruct) {
            self.block_destruct();
        }
        return;
    }
        NSInteger index = buttonIndex-actionSheet.cancelButtonIndex-1;
        if (self.block_clickIndex) {
            self.block_clickIndex(index);
        }
   
    
}
-(void) showAlertViewInViewController:(UIViewController*)vc{
    if ([CYHelp_base systemVersionGreaterThanIOS7]) {
        [vc presentViewController:alertController animated:YES completion:nil];
    }else{
        [alertview show];
    }
}
@end

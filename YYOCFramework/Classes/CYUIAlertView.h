//
//  CYUIAlertView.h
//  KHMall
//
//  Created by 198 on 16/6/16.
//  Copyright © 2016年 198. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYHelp_base.h"

@interface CYUIAlertView : NSObject
//+(CYUIAlertView *)showAlertViewInViewController:(UIViewController *)vc title:(NSString *)title message:(NSString *)msg cancelButtonTitle:(NSString *)cancelTitle;

/**
 *  根据系统iOS7or以上的系统创建alertView，AlertController
 *
 *  @param title             title description
 *  @param msg               msg description
 *  @param cancelButtonTitle cancelButtonTitle description
 *  @param otherButtonTitles otherButtonTitles description
 *
 *  @return CYUIAlertView
 */
- (CYUIAlertView *)initWithAlertViewTitle:(NSString *)title message:(NSString *)msg cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles,... NS_REQUIRES_NIL_TERMINATION;
- (CYUIAlertView *)initWithActionSheetTitle:(NSString *)title message:(NSString *)msg cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles,... NS_REQUIRES_NIL_TERMINATION;
- (void)showActionSheetInViewController:( UIViewController*)vc;
- (void)showAlertViewInViewController:( UIViewController*)vc;
@property(nonatomic,strong)CYBlock_void block_cancel;//点击取消按钮
@property(nonatomic,strong)CYBlock_void block_destruct;//点击 destructiveButton
@property(nonatomic,strong)CYBlock_Integer block_clickIndex;//actionsheet点击其他的按钮，下标从0开始

@end

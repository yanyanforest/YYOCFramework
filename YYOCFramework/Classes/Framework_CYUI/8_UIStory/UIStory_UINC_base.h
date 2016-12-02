//
//  UIStory_UINC_base.h
//  KHMall
//
//  Created by 198 on 16/5/18.
//  Copyright © 2016年 198. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CYUIVC_base.h"
@interface UIStory_UINC_base : NSObject<UINavigationControllerDelegate>
@property (nonatomic,strong,readonly) UINavigationController *navigationController;
@property(nonatomic,strong)CYUIVC_base *rootController;
@end

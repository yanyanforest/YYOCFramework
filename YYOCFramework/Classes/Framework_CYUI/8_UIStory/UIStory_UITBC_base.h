//
//  UIStory_UITBC_base.h
//  KHMall
//
//  Created by 198 on 16/5/18.
//  Copyright © 2016年 198. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIStory_UITBC_base : NSObject<UITabBarControllerDelegate>
@property(nonatomic,strong,readonly) UITabBarController *tabBarController;
@property(nonatomic,strong)NSArray *vcConfigs;
@property(nonatomic,readonly) NSInteger lastSelectedIndex;
@end

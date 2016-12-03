//
//  CYHelp_base.h
//  KHMall
//
//  Created by 198 on 16/6/16.
//  Copyright © 2016年 198. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYBlock.h"

@interface CYHelp_base : NSObject
/**
 *  当前 iOS 系统版本是否>=7
 *
 *  @return bool
 */
+ (BOOL)systemVersionGreaterThanIOS7;
/**
 *  获取当前应用的名字
 *
 *  @return 应用的名字
 */
+ (NSString *)AppName;
/**
 *  获取应用的当前版本
 *
 *  @return 版本
 */
+ (NSString *)AppVersion;
@end

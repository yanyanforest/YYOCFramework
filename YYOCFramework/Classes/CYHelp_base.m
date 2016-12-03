//
//  CYHelp_base.m
//  KHMall
//
//  Created by 198 on 16/6/16.
//  Copyright © 2016年 198. All rights reserved.
//

#import "CYHelp_base.h"

@implementation CYHelp_base
+ (BOOL)systemVersionGreaterThanIOS7
{
  return !([[[UIDevice currentDevice]systemVersion] floatValue]<8.0);
}
+ (NSString *)AppName
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // app名称
    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    return app_Name;
}
+ (NSString *)AppVersion
{
    NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return appVersion;
}
@end

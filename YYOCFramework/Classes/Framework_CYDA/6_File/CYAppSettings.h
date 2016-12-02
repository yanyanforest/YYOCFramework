//
//  CYAppSettings.h
//  KHMall
//
//  Created by yanyan on 16/11/1.
//  Copyright © 2016年 198. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYAppSettings : NSObject
+ (instancetype)SharedInstance;
- (void)readingPreferences;
@end

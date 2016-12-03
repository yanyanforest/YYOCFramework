//
//  UIColor+RandomColor.h
//  KHMall
//
//  Created by 198 on 16/5/21.
//  Copyright © 2016年 198. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (RandomColor)
//随机颜色
+ (UIColor *)randomColor;
@end
@interface UIColor (Hex)
//颜色转换 IOS中十六进制的颜色转换为UIColor
+ (UIColor *)colorWithHexString:(NSString *)hexString;
//类扩展之Hex值颜色转换
+ (UIColor *)colorWithHex:(long)hexColor;
+ (UIColor *)colorWithHex:(long)hexColor alpha:(CGFloat) alpha;
@end
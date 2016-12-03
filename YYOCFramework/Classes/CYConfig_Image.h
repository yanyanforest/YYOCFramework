//
//  CYConfig_Image.h
//  KHMall
//
//  Created by 198 on 16/5/18.
//  Copyright © 2016年 198. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYConfig_Image : NSObject


/**
 *  一般引用第三方字体文件时，会用到
 *
 *  @param text  第三方字的标识
 *  @param color 要显示的字颜色
 *  @param font  是那个字体
 *  @param size  要显示的大小Size
 *
 *  @return 返回图片
 */
+(UIImage *)imageForString:(NSString *)text textColor :(UIColor *)color font:(UIFont *)font imageSize:(CGSize)size;

@end

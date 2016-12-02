
//
//  CYConfig_Image.m
//  KHMall
//
//  Created by yanyan on 16/5/18.
//  Copyright © 2016年 198. All rights reserved.
//

#import "CYConfig_Image.h"

@implementation CYConfig_Image

+(UIImage *)imageForString:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font imageSize:(CGSize)size{
    UITextView* label = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    label.text = text;
    label.textColor = textColor;
    if (font) {
        label.font = font;

    }
    
    label.backgroundColor = [UIColor clearColor];
    UIGraphicsBeginImageContextWithOptions(label.frame.size, false, 0.0);
    [label.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
//    return image;
    CGSize newSize = CGSizeMake(36, 36);
    if (!CGSizeEqualToSize(size, CGSizeZero) ) {
        newSize = size;
    }
    UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
    CGFloat originX = 5;//(label.frame.size.width/2 -newSize.width)/2.0;//label.frame.size.width/2-newSize.width;//

    CGFloat originY = (label.frame.size.height/2 -newSize.height)/2.0;
    [image drawInRect:CGRectMake(originX, originY, newSize.width, newSize.height)];

    UIImage *newImage  = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;

}
@end

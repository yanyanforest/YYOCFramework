//
//  CYUIPlaceholderTextView.h
//  KHMall
//
//  Created by yanyan on 16/10/27.
//  Copyright © 2016年 198. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYUIPlaceholderTextView : UITextView
@property (nonatomic,strong) NSString  *placeholder;       // default is nil.
@property (nonatomic,strong) UIColor   *placeholderColor;  // default is [UIColor grayColor];
@property (nonatomic,strong) UIFont    *placeholderFont;   // default is TextView Font
@property (nonatomic) CGPoint   placeholderPoint;   // default is (8,8)
@end

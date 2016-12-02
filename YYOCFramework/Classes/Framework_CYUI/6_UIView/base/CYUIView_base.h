//
//  CYUIView_base.h
//  KHMall
//
//  Created by 198 on 16/5/19.
//  Copyright © 2016年 198. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYBlock.h"

@interface CYUIView_base : UIView
@property(nonatomic,strong)id object;//view所要显示的对象
-(void)addSubviews;
@end

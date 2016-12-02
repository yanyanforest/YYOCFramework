//
//  CYUICVHeader_base.m
//  KHMall
//
//  Created by 198 on 16/5/24.
//  Copyright © 2016年 198. All rights reserved.
//

#import "CYUICVHeader_base.h"

@implementation CYUICVHeader_base
-(instancetype)init
{
    if (self = [super init]) {
        [self addSubviews];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self addSubviews];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
    }
    return self;
}
-(void)addSubviews
{
    
}
@end

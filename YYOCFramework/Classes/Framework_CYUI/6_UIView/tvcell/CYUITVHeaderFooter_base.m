//
//  CYUITVHeaderFooter_base.m
//  KHMall
//
//  Created by 198 on 16/5/21.
//  Copyright © 2016年 198. All rights reserved.
//

#import "CYUITVHeaderFooter_base.h"

@implementation CYUITVHeaderFooter_base
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self addSubviews];
    }
    return self;
}
- (void)addSubviews
{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

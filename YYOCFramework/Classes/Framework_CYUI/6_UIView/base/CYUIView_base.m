//
//  CYUIView_base.m
//  KHMall
//
//  Created by 198 on 16/5/19.
//  Copyright © 2016年 198. All rights reserved.
//

#import "CYUIView_base.h"

@implementation CYUIView_base

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubviews];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)addSubviews{
    
}
@end

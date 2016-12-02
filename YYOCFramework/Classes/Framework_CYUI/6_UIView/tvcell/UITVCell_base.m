//
//  UITVCell_base.m
//  KHMall
//
//  Created by 198 on 16/5/19.
//  Copyright © 2016年 198. All rights reserved.
//

#import "UITVCell_base.h"

@implementation UITVCell_base
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubviews];
    }
    return  self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)addSubviews{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

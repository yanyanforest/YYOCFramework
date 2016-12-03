//
//  CYUIPlaceholderTextView.m
//  KHMall
//
//  Created by yanyan on 16/10/27.
//  Copyright © 2016年 198. All rights reserved.
//

#import "CYUIPlaceholderTextView.h"

@implementation CYUIPlaceholderTextView
- (instancetype)init
{
    if (self = [super init]) {
        [self addTextChangeObserver];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self addTextChangeObserver];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addTextChangeObserver];
    }
    return self;
}

- (void)dealloc
{
    [self removeTextChangeObserver];
}

- (void)addTextChangeObserver
{
    self.placeholderColor = [UIColor grayColor];
    self.placeholderPoint = CGPointMake(8, 8);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewTextChanged:) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)removeTextChangeObserver
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIFont *font = self.placeholderFont ? self.placeholderFont : self.font;
    
    if (self.placeholder && self.placeholder.length > 0 && self.text.length == 0)
    {
        CGRect rect = CGRectMake(self.placeholderPoint.x,
                                 self.placeholderPoint.y,
                                 self.bounds.size.width - self.placeholderPoint.x,
                                 self.bounds.size.height - self.placeholderPoint.y);
        if ([self.placeholderColor respondsToSelector:@selector(drawInRect:withAttributes:)])
        {
            NSDictionary* attributes = @{NSFontAttributeName:font,NSForegroundColorAttributeName:self.placeholderColor};
            [self.placeholder drawInRect:rect withAttributes:attributes];
        }
        else
        {
            CGContextSetFillColorWithColor(context, self.placeholderColor.CGColor);
            [self.placeholder drawInRect:rect withFont:self.font lineBreakMode:NSLineBreakByCharWrapping];
        }
    }
}

#pragma mark - Set Method

- (void)setText:(NSString *)text
{
    [super setText:text];
    
    [self textViewTextChanged:nil];
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    
    [self setNeedsDisplay];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    
    [self setNeedsDisplay];
}

- (void)setPlaceholderPoint:(CGPoint)placeholderPoint
{
    _placeholderPoint = placeholderPoint;
    
    [self setNeedsDisplay];
}

- (void)textViewTextChanged:(NSNotification *)notification
{
    if (self.placeholder.length != 0)
    {
        [self setNeedsDisplay];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

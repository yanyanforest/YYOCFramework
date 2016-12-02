//
//  CYUIVC_Introduction.m
//  KHMall
//
//  Created by 198 on 16/6/17.
//  Copyright © 2016年 198. All rights reserved.
//

#import "CYUIVC_Introduction.h"
#import "CYUIView_Introduction.h"
@interface CYUIVC_Introduction ()
@property(nonatomic,strong)CYUIView_Introduction *guideView;
@end

@implementation CYUIVC_Introduction

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    __weak typeof(self)weakSelf = self;
    self.guideView = [[CYUIView_Introduction alloc]initWithFrame:self.view.bounds];
    self.guideView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.guideView.guideButton setBackgroundColor:[UIColor redColor]];
    [self.guideView.guideButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.guideView.guideButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    self.guideView.block_guideClick = ^(id sender){
        if (weakSelf.block_guideClick) {
            weakSelf.block_guideClick(sender);
        }
    };
    [self.view addSubview:self.guideView];
    if ([self isViewLoaded]) {
        if (self.imageArray) {
            [self setImageArray:self.imageArray];
        }
    }
}
-(void)setImageArray:(NSArray *)imageArray
{
    _imageArray = imageArray;
    if ([self isViewLoaded]) {
        [self.guideView showGuideViewWithImagesData:_imageArray];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

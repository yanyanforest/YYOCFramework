//
//  CYUIVC_PhotoBrowser.m
//  KHMall
//
//  Created by yanyan on 16/9/19.
//  Copyright © 2016年 198. All rights reserved.
//

#import "CYUIVC_PhotoBrowser.h"
#import "CYUIView_PhotoBrowser.h"

@interface CYUIVC_PhotoBrowser ()
@property(nonatomic,strong)CYUIView_PhotoBrowser *uiview_photoBrowser;
@end

@implementation CYUIVC_PhotoBrowser

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];

}
- (void)addSubviews
{
    [super addSubviews];
    __weak typeof(self)weakSelf = self;
    // Do any additional setup after loading the view.
    _uiview_photoBrowser = [[CYUIView_PhotoBrowser alloc] initWithFrame:self.view.bounds];
    _uiview_photoBrowser.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _uiview_photoBrowser.block_dismiss = ^(id sender) {
        [weakSelf dissmissVC];
    };
    _uiview_photoBrowser.isShowPageControl = YES;
    _uiview_photoBrowser.isShowPageNumView = YES;
    _uiview_photoBrowser.itemsArr = self.object;
    _uiview_photoBrowser.currentIndex = self.currentIndex;
    [self.view addSubview:_uiview_photoBrowser];

}
- (void)dissmissVC{
    [self dismissViewControllerAnimated:YES completion:nil];
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

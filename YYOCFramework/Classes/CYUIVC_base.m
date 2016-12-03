
//
//  CYUIVC_base.m
//  KHMall
//
//  Created by 198 on 16/5/18.
//  Copyright © 2016年 198. All rights reserved.
//



#import "CYUIVC_base.h"


@interface CYUIVC_base ()

@end

@implementation CYUIVC_base

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = NO;
    [self addBarButtons];
    [self addSubviews];
    if ([self isViewLoaded]) {
        [self writeView];
    }
    
}
-(void)addSubviews{
    
}
-(void)addBarButtons{
    
}
-(void)writeView{
    
}
- (void)hideTabBar:(BOOL)hide
{
//    if (!self.tabBarController) {
//        return;
//    }
//    if ( [self.tabBarController.view.subviews count] < 2 )
//    {
//        return;
//    }
////    self.hidesBottomBarWhenPushed = hide;
////    self.tabBarController.tabBar.hidden = hide;
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:0.2];
//
//    
//    UIView *contentView;
//
//    if ( [[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
//    {
//        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
//    }
//    else
//    {
//        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
//    }
////    for (UIView *subView in self.tabBarController.view.subviews) {
////        if ([subView isKindOfClass:NSClassFromString(@"UITransitionView")]) {
////            //调整子视图的高度，UITransitionView视图为UINavitaionController的根视图
////            //            subView.frame = CGRectMake(subView.frame.origin.x, subView.frame.origin.y, subView.frame.size.width, 480);
////            
////            CGRect frame = subView.frame;
////            subView.frame = frame;
////            DLog(@"UITransitionView.frame --%@",NSStringFromCGRect(frame));
////
////        }
////    }
//    if ( hide )
//    {
//        contentView.frame = self.tabBarController.view.bounds;
//        self.view.frame = contentView.frame;
//        DLog(@"self.view.frame --%@",NSStringFromCGRect(self.view.frame));
//    }
//    else
//    {
//        contentView.frame = CGRectMake(self.tabBarController.view.bounds.origin.x,
//                                       self.tabBarController.view.bounds.origin.y,
//                                       self.tabBarController.view.bounds.size.width,
//                                       self.tabBarController.view.bounds.size.height - self.tabBarController.tabBar
//                                       .frame.size.height);
//        DLog(@"self.view.frame --%@",NSStringFromCGRect(contentView.frame));
//
//    }
    self.tabBarController.tabBar.hidden = hide;

//
//    [UIView commitAnimations];
    CGFloat tagNum = 1;

    if (!hide) {
         tagNum = -1;
    }
        CGFloat kDuration = 0.3;
        for (UIView *v in [self.tabBarController.view subviews]) {
            v.backgroundColor = [UIColor clearColor];

            if ([v isKindOfClass:[UITabBar class]]) {
                [UIView animateWithDuration:kDuration delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^(){
//                    self.hidesBottomBarWhenPushed = hide;

                    CGRect frame = v.frame;
                    frame.origin.y += (49.0f * tagNum);
                    v.frame = frame;
                    
                } completion:^(BOOL complete)
                 {
                 }];
            } else {
                
                
                [UIView animateWithDuration:kDuration delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^(){
//                    self.hidesBottomBarWhenPushed = hide;
                    CGRect frame = v.frame;
                    frame.size.height += (49.0f * tagNum);
                    v.frame = frame;
                    
                } completion:nil];
            }
        }

    
}
- (void)showFullScreen:(BOOL)fullScreen {
    // 状态条
    [UIApplication sharedApplication].statusBarHidden = fullScreen;
    // 导航条
    [self.navigationController setNavigationBarHidden:fullScreen];
    // tabBar的隐藏通过在初始化方法中设置hidesBottomBarWhenPushed属性来实现。
}
- (void)setObject:(id)object
{
    _object = object;
    if ([self isViewLoaded]) {
        [self writeView];
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

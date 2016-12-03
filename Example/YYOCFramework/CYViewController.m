//
//  CYViewController.m
//  YYOCFramework
//
//  Created by yanyan on 12/01/2016.
//  Copyright (c) 2016 yanyan. All rights reserved.
//

#import "CYViewController.h"
#import <YYOCFramework/NSDate+Calendar.h>

#import "YYOCFramework/YYOCFramework.h"
@interface CYViewController ()

@end

@implementation CYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSDate *date = [NSDate date];
    NSLog(@"%@",[NSDate dateStringWithDate:date]);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

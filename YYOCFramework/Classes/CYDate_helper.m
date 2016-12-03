//
//  CYDate_helper.m
//  Pods
//
//  Created by yanyan on 16/12/2.
//
//

#import "CYDate_helper.h"

@implementation CYDate_helper

- (NSString *)dateStringWithDate:(NSDate *)date formatStyle:(NSString *)formatStyle
{
    NSDate *curDate = date?date:[NSDate date];
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:formatStyle];
    return [format stringFromDate:curDate];
}
@end

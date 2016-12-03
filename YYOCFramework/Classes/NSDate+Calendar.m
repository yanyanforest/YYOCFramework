//
//  NSDate+Calender.m
//  Pods
//
//  Created by yanyan on 16/12/3.
//
//

#import "NSDate+Calendar.h"

@implementation NSDate (Calendar)
static NSCalendar * myCalendar;

+ (NSCalendar *)calendar
{
    if (myCalendar == nil) {
        myCalendar = [NSCalendar currentCalendar];
    }
    return myCalendar;
}

+ (NSInteger)orderOfWeekInMonthForDateComponents:(NSDateComponents *)dateComponets
{
    NSDate * date = [[self calendar] dateFromComponents:dateComponets];
    return [[self calendar] component:NSCalendarUnitWeekdayOrdinal fromDate:date];
}

+ (NSInteger)orderOfDayInWeekForDateComponents:(NSDateComponents *)dateComponets
{
    NSDate * date = [[self calendar] dateFromComponents:dateComponets];
    return [[self calendar] component:NSCalendarUnitWeekday fromDate:date];
}

+ (NSInteger)numberOfWeeksInMonthForDateComponents:(NSDateComponents *)dateComponets
{
    NSDate * date = [[self calendar] dateFromComponents:dateComponets];
    return [[self calendar] rangeOfUnit:NSCalendarUnitWeekOfMonth inUnit:NSCalendarUnitMonth forDate:date].length;
}

+ (NSInteger)numberOfDaysInMonthForDateComponents:(NSDateComponents *)dateComponets
{
    NSDate * date = [[self calendar] dateFromComponents:dateComponets];
    return [[self calendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
}

+ (NSInteger)yearForDate:(NSDate *)date
{
    return [[self calendar] component:NSCalendarUnitYear fromDate:date];
}

+ (NSInteger)monthForDate:(NSDate *)date
{
    return [[self calendar] component:NSCalendarUnitMonth fromDate:date];
}

+ (NSInteger)dayForDate:(NSDate *)date
{
    return [[self calendar] component:NSCalendarUnitDay fromDate:date];
}

+ (NSInteger)orderOfWeekInMonthForDate:(NSDate *)date
{
    return [[self calendar] component:NSCalendarUnitWeekdayOrdinal fromDate:date];
}

+ (NSInteger)orderOfDayInWeekForDate:(NSDate *)date
{
    return [[self calendar] component:NSCalendarUnitWeekday fromDate:date];
}

+ (NSInteger)numberOfWeeksInMonthForDate:(NSDate *)date
{
    return [[self calendar] rangeOfUnit:NSCalendarUnitWeekOfMonth inUnit:NSCalendarUnitMonth forDate:date].length;
}

+ (NSInteger)numberOfDaysInMonthForDate:(NSDate *)date
{
    return [[self calendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
}

+ (NSInteger)numberOfDaysInCurrentMonth
{
    return [[self calendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[self date]].length;
}

+ (NSString *)dateStringForDate:(NSDate *)date
{
    return [NSString stringWithFormat:@"%d-%02d-%02d %02d:%02d:%02d", [self yearForDate:date], [self monthForDate:date], [self dayForDate:date], [self hourForDate:date], [self minuteForDate:date],[self secondForDate:date]];
}
+ (NSString *)timeStringForDate:(NSDate *)date
{
    return [NSString stringWithFormat:@"%02d:%02d:%02d", [self hourForDate:date], [self minuteForDate:date], [self secondForDate:date]];
}
+ (NSInteger)hourForDate:(NSDate *)date
{
    return [[self calendar] component:NSCalendarUnitHour fromDate:date];
}

+ (NSInteger)minuteForDate:(NSDate *)date
{
    return [[self calendar] component:NSCalendarUnitMinute fromDate:date];
}

+ (NSInteger)secondForDate:(NSDate *)date
{
    return [[self calendar] component:NSCalendarUnitSecond fromDate:date];
}

+ (NSString *)timeForDate:(NSDate *)date
{
    return [NSString stringWithFormat:@"%02d:%02d:%02d", [self hourForDate:date], [self minuteForDate:date], [self secondForDate:date]];
}
@end

//
//  NSDate+Calender.h
//  Pods
//
//  Created by yanyan on 16/12/3.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (Calendar)

/**
 *  根据给定的日期设置得到该日期所在周是当月的第几周
 *
 *  @param dateComponets 给定的日期设置
 *
 *  @return 给定日期设置所在周在当月的索引
 */
+ (NSInteger)orderOfWeekInMonthForDateComponents:(NSDateComponents *)dateComponets;
/**
 *  根据给定的日期设置得到该日期是周几（索引）
 *
 *  @param dateComponets 给定的日期设置
 *
 *  @return 周几（索引）
 */
+ (NSInteger)orderOfDayInWeekForDateComponents:(NSDateComponents *)dateComponets;
/**
 *  根据给定的日期设置得到该日期当月共有几周
 *
 *  @param dateComponets 给定的日期设置
 *
 *  @return 给定日期设置当月的总周数
 */
+ (NSInteger)numberOfWeeksInMonthForDateComponents:(NSDateComponents *)dateComponets;
/**
 *  根据给定的日期设置得到该日期当月共有多少天
 *
 *  @param dateComponets 给定的日期设置
 *
 *  @return 给定日期设置当月的总天数
 */
+ (NSInteger)numberOfDaysInMonthForDateComponents:(NSDateComponents *)dateComponets;
/**
 *  根据给定的日期得到该日期的年
 *
 *  @param date 给定的日期
 *
 *  @return 日期的年
 */
+ (NSInteger)yearForDate:(NSDate *)date;
/**
 *  根据给定的日期得到该日期的月
 *
 *  @param date 给定的日期
 *
 *  @return 日期的月
 */
+ (NSInteger)monthForDate:(NSDate *)date;
/**
 *  根据给定的日期得到该日期的日
 *
 *  @param date 给定的日期
 *
 *  @return 日期的日
 */
+ (NSInteger)dayForDate:(NSDate *)date;
/**
 *  根据给定的日期得到该日期所在周是当月的第几周
 *
 *  @param date 给定的日期
 *
 *  @return 给定日期所在周在当月的索引
 */
+ (NSInteger)orderOfWeekInMonthForDate:(NSDate *)date;
/**
 *  根据给定的日期得到该日期是周几（索引）
 *
 *  @param date 给定的日期
 *
 *  @return 周几（索引）
 */
+ (NSInteger)orderOfDayInWeekForDate:(NSDate *)date;
/**
 *  根据给定的日期得到该日期当月共有几周
 *
 *  @param date 给定的日期
 *
 *  @return 给定日期当月的总周数
 */
+ (NSInteger)numberOfWeeksInMonthForDate:(NSDate *)date;
/**
 *  根据给定的日期得到该日期当月共有多少天
 *
 *  @param date 给定的日期
 *
 *  @return 给定日期当月的总天数
 */
+ (NSInteger)numberOfDaysInMonthForDate:(NSDate *)date;
/**
 *  此时 当前月共有多少天
 *
 *  @return 此时当前月总天数
 */
+ (NSInteger)numberOfDaysInCurrentMonth;
/**
 *  根据给定的日期得到 年月日 时分秒 的格式化输出
 *
 *  @param date 给定的日期
 *
 *  @return 年月日 时分秒 的格式化输出
 */
+ (NSString *)dateStringForDate:(NSDate *)date;
/**
 *  根据给定的日期得到该日期 时分秒 的格式化输出
 *
 *  @param date 给定的日期
 *
 *  @return 时分秒 的格式化输出
 */
+ (NSString *)timeStringForDate:(NSDate *)date;
/**
 *  根据给定的日期得到该日期的时
 *
 *  @param date 给定的日期
 *
 *  @return 日期的时
 */
+ (NSInteger)hourForDate:(NSDate *)date;
/**
 *  根据给定的日期得到该日期的分
 *
 *  @param date 给定的日期
 *
 *  @return 日期的分
 */
+ (NSInteger)minuteForDate:(NSDate *)date;
/**
 *  根据给定的日期得到该日期的秒
 *
 *  @param date 给定的日期
 *
 *  @return 日期的秒
 */
+ (NSInteger)secondForDate:(NSDate *)date;

@end

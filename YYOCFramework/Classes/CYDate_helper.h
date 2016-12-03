//
//  CYDate_helper.h
//  Pods
//
//  Created by yanyan on 16/12/2.
//
//

#import <Foundation/Foundation.h>

@interface CYDate_helper : NSObject
/**
 *  返回时间字符串
 *
 *  @param date        date 如果为 nil 则为当前时间，反之显示传递的时间
 *  @param formatStyle 要展示日期的格式。
 *
 *  @return return 当前时间
 */
- (NSString *)dateStringWithDate:(nullable __kindof NSDate *)date formatStyle:(NSString *)formatStyle;

@end

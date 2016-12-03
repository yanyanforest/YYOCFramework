//
//  CYString_helper.h
//  Pods
//
//  Created by yanyan on 16/12/2.
//
//

#import <Foundation/Foundation.h>

@interface CYString_helper : NSObject

/**
*  根据 object返回 可以为nil或非nil的 String
*
*  @param object 一般这个类型比较固定，比如NSString，NSNull
*
*  @return 可为空或非空
*/
+ (nullable __kindof NSString *)NullableStringWithObject:(id)object;
/**
 *  根据 object返回  String
 *
 *  @param object 一般这个类型比较固定，比如NSString，NSNull
 *
 *  @return 非空字符串
 */
+ (NSString *)StringWithObject:(id)object;
@end

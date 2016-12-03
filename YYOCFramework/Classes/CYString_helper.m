//
//  CYString_helper.m
//  Pods
//
//  Created by yanyan on 16/12/2.
//
//

#import "CYString_helper.h"

@implementation CYString_helper
+ (NSString *)NullableStringWithObject:(id)object
{
    if ([object isKindOfClass:[NSNull null]]) {
        return nil;
    } else if([object isKindOfClass:[NSString class]]) {
        if ([object isEqualToString:@"null"]) {
            return nil;
        }
        return object;
    }
    return object;
}

+ (NSString *)StringWithObject:(id)object
{
    NSString *returnString = @"";
    if (!object) {
        return returnString;
    }
    if ([object isKindOfClass:[NSNull null]]) {
        return returnString;
    }
    if([object isKindOfClass:[NSString class]]) {
        if ([object isEqualToString:@"null"] || [object isEqualToString:@"nil"]) {
            return returnString;
        }
        return object;
    }
    [object respondsToSelector:@selector(description)];
    
    NSAssert([object isKindOfClass:[NSString class]], @"类型不是 NSString类型");
    
    return object;
}
@end

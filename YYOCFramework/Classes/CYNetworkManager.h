//
//  CYNetworkManager.h
//  KHMall
//
//  Created by 198 on 16/6/15.
//  Copyright © 2016年 198. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kNetworkReachabilityChanged @"AFNetworkReachabilityStatusChanged"

#define kNetworkReachabilityViaWWAN @"AFNetworkReachabilityStatusReachableViaWiFi"
#define kNetworkReachabilityViaWiFi @"AFNetworkReachabilityStatusReachableViaWWAN"
#define kNetworkReachabilityNotReachable @"AFNetworkReachabilityStatusNotReachable"
#define kNetworkReachabilityUnknown @"AFNetworkReachabilityStatusUnknown"
@interface CYNetworkManager : NSObject
+(void)monitorNetwork;
@end

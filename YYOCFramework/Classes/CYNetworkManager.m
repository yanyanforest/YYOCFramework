//
//  CYNetworkManager.m
//  KHMall
//
//  Created by yanyan on 16/6/15.
//  Copyright © 2016年 yanyan. All rights reserved.
//

#import "CYNetworkManager.h"
#import <AFNetworking/AFNetworking.h>
@implementation CYNetworkManager
+(void)monitorNetwork{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
//    manager.isReachable;
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //当网络状态发生变化时会调用这个block
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [[NSNotificationCenter defaultCenter] postNotificationName:kNetworkReachabilityChanged object:kNetworkReachabilityViaWiFi];
                [[NSNotificationCenter defaultCenter] postNotificationName:kNetworkReachabilityViaWiFi object:nil];
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                [[NSNotificationCenter defaultCenter] postNotificationName:kNetworkReachabilityChanged object:kNetworkReachabilityViaWWAN];
                [[NSNotificationCenter defaultCenter]postNotificationName:kNetworkReachabilityViaWWAN object:nil];
                break;
            case AFNetworkReachabilityStatusNotReachable:
                [[NSNotificationCenter defaultCenter] postNotificationName:kNetworkReachabilityChanged object:kNetworkReachabilityNotReachable];
               [[NSNotificationCenter defaultCenter] postNotificationName:kNetworkReachabilityNotReachable object:nil];
                break;
            case AFNetworkReachabilityStatusUnknown:
                [[NSNotificationCenter defaultCenter] postNotificationName:kNetworkReachabilityChanged object:kNetworkReachabilityUnknown];
                [[NSNotificationCenter defaultCenter]postNotificationName:kNetworkReachabilityUnknown object:nil];
                break;
                
            default:
                break;
        }
    }];
    [manager startMonitoring];
}

@end

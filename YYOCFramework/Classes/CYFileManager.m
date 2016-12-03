//
//  CYFileManager.m
//  KHMall
//
//  Created by 198 on 16/6/10.
//  Copyright © 2016年 198. All rights reserved.
//

#import "CYFileManager.h"

@implementation CYFileManager
+(void)writeData:(id)object toFilePath:(NSString *)path;
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
//    DLog(@"%@",path.lastPathComponent);
    if (![fileManager fileExistsAtPath:path]) {
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        NSAssert(!error, @"创建路径错误");
    }
    NSString *fullPath = [path stringByAppendingPathComponent:path.lastPathComponent];
    [NSKeyedArchiver archiveRootObject:object toFile:fullPath];

}
+(void)createFileToPath:(NSString *)path{
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSError *error = nil;
////    DLog(@"%@",path.lastPathComponent);
//    if (![fileManager fileExistsAtPath:path]) {
//        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
//        NSAssert(!error, @"创建路径错误");
//    }
//    NSString *fullPath = [path stringByAppendingPathComponent:path.lastPathComponent];
 
}

+ (id)readDataWithFilePath:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:path]) {
        return nil;
    }
    NSString *fullPath = [path stringByAppendingPathComponent:path.lastPathComponent];

    id object = [NSKeyedUnarchiver unarchiveObjectWithFile:fullPath];
    return object;
}
@end

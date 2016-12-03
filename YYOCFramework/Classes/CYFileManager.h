//
//  CYFileManager.h
//  KHMall
//
//  Created by yanyan on 16/6/10.
//  Copyright © 2016年 yanyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYFileManager : NSObject
//+ (void)createFileToPath:(NSString *)path;
/**
 *  把 object写入 path 路径下path文件
 *如/name/filePath,则真正的路径/name/filePath/filePath文件
 *  @param object
 *  @param path  
 */
+ (void)writeData:(id)object toFilePath:(NSString *)path;
// 从 path 里面读取数据
+ (id)readDataWithFilePath:(NSString *)path;
@end

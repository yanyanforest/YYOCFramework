//
//  CYFileManager.h
//  KHMall
//
//  Created by 198 on 16/6/10.
//  Copyright © 2016年 198. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYFileManager : NSObject
+(void)createFileToPath:(NSString *)path;
+(void)writeData:(id) object toFilePath:(NSString *)path;
+(id)readDataWithFilePath:(NSString *)path;
@end

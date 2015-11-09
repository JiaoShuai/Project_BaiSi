//
//  NSString+KYFileCache.m
//  百思不得姐
//
//  Created by 郑开元 on 15/9/8.
//  Copyright (c) 2015年 郑开元. All rights reserved.
//

#import "NSString+KYFileCache.h"

@implementation NSString (KYFileCache)
-(NSInteger)fileCache
{
    NSFileManager * mng=[NSFileManager defaultManager];
    BOOL isDirectory=NO;
    BOOL isExist=[mng fileExistsAtPath:self isDirectory:&isDirectory];
    //文件路径不存在
    if (isExist==NO) return 0;
    
    if (isDirectory == YES) {//是文件夹
        NSInteger size=0;
        //遍历文件夹所有内容
        NSDirectoryEnumerator * enumerator = [mng enumeratorAtPath:self];
        for (NSString * subPath in enumerator) {
            //全路径
            NSString * fullPath = [self stringByAppendingPathComponent:subPath];
            size += [mng attributesOfItemAtPath:fullPath error:nil].fileSize;
        }
        return size;
    }else{//是文件
         return [mng attributesOfItemAtPath:self error:nil].fileSize;
    }
}
@end

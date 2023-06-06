//
//  GXCahce.m
//  BJNewsUtils
//
//  Created by wolffy on 2020/12/25.
//  Copyright © 2020 北京光线传媒股份有限公司. All rights reserved.
//

#import "GXCahce.h"

@implementation GXCahce

/**
 初始化userDefaults
 
 @param suiteName 功能名称
 */
- (instancetype)initWithSuiteName:(NSString *)suiteName{
    self = [super init];
    if(self){
        self.suiteName = suiteName;
    }
    return self;
}

#pragma mark - 路径

/**
  文件存储目录
 */
- (NSString *)basePath{
    NSString * basePath = [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Caches/user_cache"];
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:basePath];
    if(isExist == NO){
        [[NSFileManager defaultManager] createDirectoryAtPath:basePath withIntermediateDirectories:YES attributes:@{} error:nil];
    }
    return basePath;
}

/**
 文件存储路径
 */
- (NSString *)filePath{
    NSString * basePath = [self basePath];
    NSString * path = [NSString stringWithFormat:@"%@/%@.json",basePath,self.suiteName];
    return path;
}

#pragma mark - 写入

/**
 将dictionary写入到本地

 @param dictionary dictionary
 */
- (void)writeWithDictionary:(NSDictionary *)dictionary{
    @try {
        if(dictionary == nil || ![dictionary isKindOfClass:[NSDictionary class]]){
            return;
        }
        NSString * path = [self filePath];
        if([[NSFileManager defaultManager] fileExistsAtPath:path]){
            [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
        }
//        [dictionary writeToFile:path atomically:NO];
        NSData * data = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:nil];
        [data writeToFile:path atomically:NO];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

#pragma mark - 增、改

/**
 更新单个缓存数据
 
 @param value value
 @param key key
 */
- (void)updateValue:(id)value withKey:(NSString *)key{
    @try {
        if(value == nil || [value isKindOfClass:[NSNull class]]){
            value = @"";
        }
        NSDictionary * cache = [self dictionary];
        NSMutableDictionary * dict = [[NSMutableDictionary alloc]init];
        if(cache){
            [dict setValuesForKeysWithDictionary:cache];
        }
        [dict setObject:value forKey:key];
        [self writeWithDictionary:dict];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

/**
 批量更新缓存数据
 
 @param appendDict appendDict
 */
- (void)updateValuesWithDictionary:(NSDictionary *)appendDict{
    @try {
        NSDictionary * cache = [self dictionary];
        NSMutableDictionary * dict = [[NSMutableDictionary alloc]init];
        if(cache){
            [dict setValuesForKeysWithDictionary:cache];
        }
        if(appendDict && [appendDict isKindOfClass:[NSDictionary class]]){
            for (NSString * key in appendDict.allKeys) {
                id value = appendDict[key];
                if([value isKindOfClass:[NSNull class]]){
                    value = @"";
                }
                [dict setValue:value forKey:key];
            }
        }
        [self writeWithDictionary:dict];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

/**
 重置缓存数据
 
 @param resetDict resetDict
 */
- (void)resetValuesWithDictionary:(NSDictionary *)resetDict{
    [self deleteAllObjects];
    [self writeWithDictionary:resetDict];
}

#pragma mark - 删

/**
 删除单个缓存数据
 
 @param key key
 */
- (void)deleteObjectWithKey:(NSString *)key{
    @try {
        NSMutableDictionary * tempDict = [[NSMutableDictionary alloc]init];
        NSDictionary * cache = [self dictionary];
        if(cache && [cache isKindOfClass:[NSDictionary class]]){
            [tempDict setValuesForKeysWithDictionary:cache];
        }
        [tempDict removeObjectForKey:key];
        [self writeWithDictionary:tempDict];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

/**
 删除所有缓存数据
 */
- (void)deleteAllObjects{
    @try {
        NSString * path = [self filePath];
        BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:path];
        if(isExist){
            [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
        }
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

#pragma mark - 查

/**
 获取所有键值对
 
 @return 所有键值对
 */
- (NSDictionary *)dictionary{
    @try {
        NSString * path = [self filePath];
        BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:path];
        if(isExist == NO){
            return nil;
        }
//        NSDictionary * dict = [[NSDictionary alloc]initWithContentsOfFile:path];
        NSData * data = [[NSData alloc]initWithContentsOfFile:path];
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        return dict;
    } @catch (NSException *exception) {
        return nil;
    } @finally {
        
    }
 
}

/**
 获取单个值
 
 @param key key
 */
- (id)valueForKey:(NSString *)key{
    @try {
        NSDictionary * dict = [self dictionary];
        if(dict == nil){
            return nil;
        }
        if([dict valueForKey:key] == nil){
            return nil;
        }
        id value = dict[key];
        return value;
    } @catch (NSException *exception) {
        return nil;
    } @finally {
        
    }
}

@end

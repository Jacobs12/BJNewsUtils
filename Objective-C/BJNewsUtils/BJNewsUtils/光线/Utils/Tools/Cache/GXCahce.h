//
//  GXCahce.h
//  BJNewsUtils
//
//  Created by wolffy on 2020/12/25.
//  Copyright © 2020 北京光线传媒股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GXCahce : NSObject

/**
 功能名称
 */
@property (nonatomic,copy) NSString * suiteName;

/**
 初始化userDefaults
 
 @param suiteName 功能名称
 */
- (instancetype)initWithSuiteName:(NSString *)suiteName;

#pragma mark - 增、改

/**
 更新单个缓存数据

 @param value value
 @param key key
 */
- (void)updateValue:(id)value withKey:(NSString *)key;

/**
 批量更新缓存数据

 @param appendDict appendDict
 */
- (void)updateValuesWithDictionary:(NSDictionary *)appendDict;

/**
 重置缓存数据

 @param resetDict resetDict
 */
- (void)resetValuesWithDictionary:(NSDictionary *)resetDict;

#pragma mark - 删

/**
 删除单个缓存数据

 @param key key
 */
- (void)deleteObjectWithKey:(NSString *)key;

/**
 删除所有缓存数据
 */
- (void)deleteAllObjects;

#pragma mark - 查

/**
 获取所有键值对
 
 @return 所有键值对
 */
- (NSDictionary *)dictionary;

/**
 获取单个值

 @param key key
 */
- (id)valueForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END

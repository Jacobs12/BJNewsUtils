//
//  GXUtils.h
//  BJNewsUtils
//
//  Created by wolffy on 2020/12/25.
//  Copyright © 2020 光线传媒. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GXUtils : NSObject

#pragma mark - 时间工具类

/// 北京时间的date formatter
+ (NSDateFormatter *)localDateFormatter;

#pragma mark - 正则表达式验证

/// 验证邮箱是否有效
/// @param email 邮箱地址
+ (BOOL)isValidatedEmail:(NSString *)email;

/// 计算身份证号码是否正确
/// @param identityString 身份证号码
+ (BOOL)isValidatedIdentity:(NSString *)identityString;

@end

NS_ASSUME_NONNULL_END

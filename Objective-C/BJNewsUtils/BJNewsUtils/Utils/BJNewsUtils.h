//
//  BJNewsUtils.h
//  BJNewsUtils
//
//  Created by wolffy on 2020/6/12.
//  Copyright © 2020 新京报社. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BJNewsUtils : NSObject

#pragma mark - 设备相关工具类

/// 判断是否是刘海屏
+ (BOOL)isHaveSafeArea;

/// 底部安全区高度
+ (CGFloat)bottomSafeAreaHeight;

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

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

@end

NS_ASSUME_NONNULL_END

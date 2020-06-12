//
//  BJNewsDevice.h
//  BJNewsUtils
//
//  Created by wolffy on 2020/6/12.
//  Copyright © 2020 新京报社. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BJNewsDevice : NSObject

/// 获取主窗口
+ (UIWindow *)mainWindow;

#pragma mark - 机型判断
/// 判断是否是刘海屏
+ (BOOL)isHaveSafeArea;

#pragma mark - 顶部区域

/// 状态栏高度
+ (CGFloat)statusBarHeight;

/// 导航栏高度
+ (CGFloat)navigationBarHeight;

#pragma mark - 底部区域

/// 底部安全区高度
+ (CGFloat)bottomSafeAreaHeight;

@end

NS_ASSUME_NONNULL_END

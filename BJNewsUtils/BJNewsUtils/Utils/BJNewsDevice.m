//
//  BJNewsDevice.m
//  BJNewsUtils
//
//  Created by wolffy on 2020/6/12.
//  Copyright © 2020 新京报社. All rights reserved.
//

#import "BJNewsDevice.h"

@implementation BJNewsDevice

+ (UIWindow *)mainWindow{
    UIWindow * window = [[UIApplication sharedApplication].windows firstObject];
    return window;
}

#pragma mark - 机型判断
/// 判断是否是刘海屏
+ (BOOL)isHaveSafeArea{
    BOOL result = NO;
    if([UIDevice currentDevice].userInterfaceIdiom != UIUserInterfaceIdiomPhone){
        return result;
    }
    UIWindow * window = [BJNewsDevice mainWindow];
    if (@available(iOS 11.0, *)) {
        if(window.safeAreaInsets.bottom > 0.1){
            result = YES;
        }
    } else {
        // Fallback on earlier versions
    }
    return result;
}

#pragma mark - 顶部区域

/// 状态栏高度
+ (CGFloat)statusBarHeight{
    CGFloat height = 20.0;
    if([BJNewsDevice isHaveSafeArea] == YES){
        height = 44.0;
    }
    return height;
}

/// 导航栏高度
+ (CGFloat)navigationBarHeight{
    CGFloat height = [BJNewsDevice statusBarHeight] + 44.0;
    return height;
}

#pragma mark - 底部区域
/// 底部安全区高度
+ (CGFloat)bottomSafeAreaHeight{
    CGFloat height = 0.0;
    if([BJNewsDevice isHaveSafeArea] == YES){
        height = 34.0;
    }
    return height;
}

@end

//
//  GXDevice.m
//  BJNewsUtils
//
//  Created by wolffy on 2020/12/25.
//  Copyright © 2020 光线传媒. All rights reserved.
//

#import "GXDevice.h"

@implementation GXDevice

/// 获取主窗口
+ (UIWindow *)mainWindow{
    UIWindow * window = [UIApplication sharedApplication].delegate.window;
    return window;
}

#pragma mark - 机型判断
/// 判断是否是刘海屏
+ (BOOL)isHaveSafeArea{
    BOOL result = NO;
//    if([UIDevice currentDevice].userInterfaceIdiom != UIUserInterfaceIdiomPhone){
//        return result;
//    }
    UIWindow * window = [GXDevice mainWindow];
    if (@available(iOS 11.0, *)) {
        if(window.safeAreaInsets.bottom > 0.1){
            result = YES;
        }
    } else {
        // Fallback on earlier versions
    }
    return result;
}

/// 以屏幕宽度为依据，判断屏幕大小
+ (BJNewsScreenWidthType)screenWidthType{
    BJNewsScreenWidthType type = BJNewsScreenWidthTypeNormal;
    CGFloat width = [GXDevice screenWidth];
    if(width < 320.0 + 1){
        type = BJNewsScreenWidthTypeMini;
    }else if (width < 375.0 + 1){
        type = BJNewsScreenWidthTypeNormal;
    }else{
        type = BJNewsScreenWidthTypePlus;
    }
    return type;
}

#pragma mark - 屏幕宽高

/// 获取屏幕宽度
+ (CGFloat)screenWidth{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat result = MIN(width, height);
    return result;
}

/// 获取屏幕高度
+ (CGFloat)screenHeight{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat result = MAX(width, height);
    return result;
}

#pragma mark - 顶部区域

/// 状态栏高度
+ (CGFloat)statusBarHeight{
    CGFloat height = 20.0;
    if([GXDevice isHaveSafeArea] == YES){
        height = 44.0;
    }
    return height;
}

/// 导航栏高度
+ (CGFloat)navigationBarHeight{
    CGFloat height = [GXDevice statusBarHeight] + 44.0;
    return height;
}

#pragma mark - 底部区域
/// 底部安全区高度
+ (CGFloat)bottomSafeAreaHeight{
    CGFloat height = 0.0;
    if([GXDevice isHaveSafeArea] == YES){
        height = 34.0;
    }
    return height;
}

/// tabbar高度
+ (CGFloat)tabBarHeight{
    CGFloat height = 49.0 + [GXDevice bottomSafeAreaHeight];
    return height;
}


@end

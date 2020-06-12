//
//  BJNewsUtils.m
//  BJNewsUtils
//
//  Created by wolffy on 2020/6/12.
//  Copyright © 2020 新京报社. All rights reserved.
//

#import "BJNewsUtils.h"
#import "BJNewsDevice.h"

@implementation BJNewsUtils

#pragma mark - 设备相关工具类

/// 判断是否是刘海屏
+ (BOOL)isHaveSafeArea{
    return [BJNewsDevice isHaveSafeArea];
}

/// 底部安全区高度
+ (CGFloat)bottomSafeAreaHeight{
    return [BJNewsDevice bottomSafeAreaHeight];
}

@end

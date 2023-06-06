//
//  GXFont.m
//  BJNewsUtils
//
//  Created by wolffy on 2020/12/25.
//  Copyright © 2020 北京光线传媒股份有限公司. All rights reserved.
//

#import "GXFont.h"

@implementation GXFont

+ (UIFont *)fontOfSize:(CGFloat)size weight:(UIFontWeight)weight{
    UIFont * font = [UIFont systemFontOfSize:size weight:weight];
    return font;
}

@end

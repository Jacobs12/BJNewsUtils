//
//  BJNewsFont.m
//  BJNewsUtils
//
//  Created by wolffy on 2020/6/12.
//  Copyright © 2020 新京报社. All rights reserved.
//

#import "BJNewsFont.h"
#import "BJNewsDevice.h"

@implementation BJNewsFont

+ (UIFont *)fontWithSize:(CGFloat)size{
    CGFloat fontSize = size;
    BJNewsScreenWidthType screenType = [BJNewsDevice screenWidthType];
    switch (screenType) {
        case BJNewsScreenWidthTypeMini:
        case BJNewsScreenWidthTypeNormal:{
            
        }
            break;
        case BJNewsScreenWidthTypePlus:{
            float d_size = 1.0;
            if(size > 15.0){
                d_size = 2.0;
            }
            fontSize = size + d_size;
        }
            break;
        default:
            break;
    }
//    UIFont * font = [UIFont systemFontOfSize:<#(CGFloat)#> weight:<#(UIFontWeight)#>]
    UIFont * font = [UIFont systemFontOfSize:fontSize];
    return font;
}

@end

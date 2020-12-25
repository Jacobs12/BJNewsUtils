//
//  ViewController.m
//  BJNewsUtils
//
//  Created by wolffy on 2020/6/12.
//  Copyright © 2020 新京报社. All rights reserved.
//

#import "ViewController.h"
#import "GXNetworking.h"
#import "GXCahce.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[GXNetworking defaultManager] POSTWithHost:@"https://qa.yibenmanhua.com" headers:@{@"test":@"value"} parameters:@{@"par":@"value2"} finished:^(NSURLResponse * _Nonnull response, NSData * _Nonnull responseData) {
        
    } failed:^(NSURLResponse * _Nonnull response, NSData * _Nonnull responseData) {
        
    }];
    GXCahce * cache = [[GXCahce alloc]initWithSuiteName:@"userinfo"];
    [cache updateValue:@"1" withKey:@"key1"];
//    [cache updateValue:@"123123" withKey:@"key2"];
    NSLog(@"%@",NSHomeDirectory());
}


@end

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
//     Do any additional setup after loading the view.
    NSString * url = @"https://api.bjnews.com.cn/api/v101/app/startup.php";
    [[GXNetworking defaultManager] POSTWithHost:url headers:@{@"test":@"value"} parameters:@{@"par":@"value2"} finished:^(NSURLResponse * _Nonnull response, NSData * _Nonnull responseData) {
        NSLog(@"%@",[[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding]);
    } failed:^(NSURLResponse * _Nonnull response, NSData * _Nonnull responseData) {

    }];
//    [[GXNetworking defaultManager] GETWithHost:url finished:^(NSURLResponse * _Nonnull response, NSData * _Nonnull responseData) {
//
//    } failed:^(NSURLResponse * _Nonnull response, NSData * _Nonnull responseData) {
//
//    }];
//    [[GXNetworking defaultManager] GETWithHost:url query:@{@"key1":@" value1",@"key2":@"value2",@"key3":@"value3"} headers:@{@"header1":@"1",@"header2":@"2",@"header3":@"3"} finished:^(NSURLResponse * _Nonnull response, NSData * _Nonnull responseData) {
//
//    } failed:^(NSURLResponse * _Nonnull response, NSData * _Nonnull responseData) {
//
//    }];
//    GXCahce * cache = [[GXCahce alloc]initWithSuiteName:@"userinfo"];
//    [cache updateValue:@"1" withKey:@"key1"];
////    [cache updateValue:@"123123" withKey:@"key2"];
    NSLog(@"%@",NSHomeDirectory());
}


@end

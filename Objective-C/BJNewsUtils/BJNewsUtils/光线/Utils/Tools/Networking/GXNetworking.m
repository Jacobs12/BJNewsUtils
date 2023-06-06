//
//  GXNetworking.m
//  BJNewsUtils
//
//  Created by wolffy on 2020/12/25.
//  Copyright © 2020 光线传媒. All rights reserved.
//

#import "GXNetworking.h"

static GXNetworking * gx_net_manager = nil;

@interface GXNetworking ()

@property (nonatomic,strong) NSMutableArray * taskArray;

@end

@implementation GXNetworking

+ (GXNetworking *)defaultManager{
    if(gx_net_manager == nil){
        gx_net_manager = [[GXNetworking alloc]init];
    }
    return gx_net_manager;
}

#pragma mark -
#pragma mark - 基础 GET POST PUT DELETE

- (NSMutableArray *)taskArray{
    if(_taskArray == nil){
        _taskArray = [[NSMutableArray alloc]init];
    }
    return _taskArray;
}

- (void)removeDataTask:(GXSessionRequest *)request{
    if(request == nil){
        return;
    }
    @try {
        if([self.taskArray containsObject:request]){
            [self.taskArray removeObject:request];
        }
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

#pragma mark -
#pragma mark - GET

/**
 *  发起GET请求，无参数
 *
 * @param host 主机名
 * @param finished 成功回调
 * @param failed 失败回调
 */
- (GXSessionRequest *)GETWithHost:(NSString *)host finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed{
    GXSessionRequest * request = [self GETWithHost:host headers:@{} finished:finished failed:failed];
    return request;
}

/**
 发起GET请求
 
 @param host 主机url
 @param headers 请求头
 @param finished 成功回调
 @param failed 失败回调
 */
- (GXSessionRequest *)GETWithHost:(NSString *)host headers:(NSDictionary *)headers finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed{
    GXSessionRequest * request = [[GXSessionRequest alloc]init];
    [self.taskArray addObject:request];
    __weak typeof(self) weak_self = self;
    [request GETWithHost:host headers:headers finished:^(NSURLResponse * _Nonnull response, NSData * _Nonnull responseData) {
        [weak_self removeDataTask:request];
        if(finished){
            finished(response,responseData);
        }
    } failed:^(NSURLResponse * _Nonnull response, NSData * _Nonnull responseData) {
        [weak_self removeDataTask:request];
        if(failed){
            failed(response,responseData);
        }
    }];;
    return request;
}

/**
 *  发起GET请求，带query参数
 *
 * @param host 主机名
 * @param query query参数
 * @param headers 请求头
 * @param finished 成功回调
 * @param failed 失败回调
 */
- (GXSessionRequest *)GETWithHost:(NSString *)host query:(NSDictionary *)query headers:(NSDictionary *)headers finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed{
//    添加query
    NSString * url = [self urlWithHost:host query:query];
    GXSessionRequest * request = [self GETWithHost:url headers:headers finished:finished failed:failed];
    return request;
}

#pragma mark - POST

/**
 * 发起POST请求
 * 参数：parameters
 *
 * @param host 主机url
 * @param parameters 请求体
 * @param finished 成功回调
 * @param failed 失败回调
 */
- (GXSessionRequest *)POSTWithHost:(NSString *)host parameters:(NSDictionary *)parameters finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed{
    GXSessionRequest * request = [self POSTWithHost:host headers:@{} parameters:parameters finished:finished failed:failed];
    return request;
}

/**
 发起POST请求

 @param host 主机url
 @param headers 请求头
 @param parameters 请求体
 @param finished 成功回调
 @param failed 失败回调
 */
- (GXSessionRequest *)POSTWithHost:(NSString *)host headers:(NSDictionary *)headers parameters:(NSDictionary *)parameters finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed{
    GXSessionRequest * request = [[GXSessionRequest alloc]init];
    __weak typeof(self) weak_self = self;
    [request POSTWithHost:host headers:headers parameters:parameters finished:^(NSURLResponse * _Nonnull response, NSData * _Nonnull responseData) {
        [weak_self removeDataTask:request];
        if(finished){
            finished(response,responseData);
        }
    } failed:^(NSURLResponse * _Nonnull response, NSData * _Nonnull responseData) {
        [weak_self removeDataTask:request];
        if(failed){
            failed(response,responseData);
        }
    }];
    return request;
}

/**
 * 发起POST请求
 * 参数：query + headers + parameters
 *
 * @param host 主机url
 * @param headers 请求头
 * @param parameters 请求体
 * @param finished 成功回调
 * @param failed 失败回调
 */
- (GXSessionRequest *)POSTWithHost:(NSString *)host query:(NSDictionary *)query headers:(NSDictionary *)headers parameters:(NSDictionary *)parameters finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed{
    NSString * url = [self urlWithHost:host query:query];
    GXSessionRequest * request = [self POSTWithHost:url headers:headers parameters:parameters finished:finished failed:failed];
    return request;
}

#pragma mark - PUT
/**
 发起PUT请求
 
 @param host 主机url
 @param headers 请求头
 @param parameters 请求体
 @param finished 成功回调
 @param failed 失败回调
 */
- (GXSessionRequest *)PUTWithHost:(NSString *)host headers:(NSDictionary *)headers parameters:(NSDictionary *)parameters finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed{
    GXSessionRequest * request = [[GXSessionRequest alloc]init];
    __weak typeof(self) weak_self = self;
    [request PUTWithHost:host headers:headers parameters:parameters finished:^(NSURLResponse * _Nonnull response, NSData * _Nonnull responseData) {
        [weak_self removeDataTask:request];
        if(finished){
            finished(response,responseData);
        }
    } failed:^(NSURLResponse * _Nonnull response, NSData * _Nonnull responseData) {
        [weak_self removeDataTask:request];
        if(failed){
            failed(response,responseData);
        }
    }];
    return request;
}

#pragma mark - DELETE
/**
 发起DELETE请求
 
 @param host 主机url
 @param headers 请求头
 @param finished 成功回调
 @param failed 失败回调
 */
- (GXSessionRequest *)DELETEWithHost:(NSString *)host headers:(NSDictionary *)headers finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed{
    GXSessionRequest * request = [[GXSessionRequest alloc]init];
    __weak typeof(self) weak_self = self;
    [request DELETEWithHost:host headers:headers finished:^(NSURLResponse * _Nonnull response, NSData * _Nonnull responseData) {
        [weak_self removeDataTask:request];
        if(finished){
            finished(response,responseData);
        }
    } failed:^(NSURLResponse * _Nonnull response, NSData * _Nonnull responseData) {
        [weak_self removeDataTask:request];
        if(failed){
            failed(response,responseData);
        }
    }];
    return request;
}

#pragma mark - utils

- (NSString *)urlWithHost:(NSString *)host query:(NSDictionary *)query{
    NSMutableString * url = [[NSMutableString alloc]initWithString:host];
    if(query == nil || ![query isKindOfClass:[NSDictionary class]]){
        query = @{};
    }
    for(int i=0;i<query.allKeys.count;i++){
        if(i == 0){
            [url appendString:@"?"];
        }
        NSString * key = [NSString stringWithFormat:@"%@",query.allKeys[i]];
        NSString * value = [NSString stringWithFormat:@"%@",[query objectForKey:key]];
        NSString * result = [NSString stringWithFormat:@"%@=%@",key,value];
//        转义
        NSCharacterSet * encodeSet = [NSCharacterSet URLQueryAllowedCharacterSet];
        result = [result stringByAddingPercentEncodingWithAllowedCharacters:encodeSet];
        [url appendString:result];
        if(i < query.allKeys.count - 1){
            [url appendString:@"&"];
        }
    }
    return url;
}


@end

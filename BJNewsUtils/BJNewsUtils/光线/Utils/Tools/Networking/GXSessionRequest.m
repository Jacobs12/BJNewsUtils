//
//  GXSessionRequest.m
//  BJNewsUtils
//
//  Created by wolffy on 2020/12/25.
//  Copyright © 2020 北京光线传媒股份有限公司. All rights reserved.
//

#import "GXSessionRequest.h"
#import <AFNetworking/AFHTTPSessionManager.h>

@interface GXSessionRequest ()

@end

@implementation GXSessionRequest

#pragma mark -
#pragma mark - 发起请求

/**
 发起GET请求

 @param host 主机url
 @param headers 请求头
 @param finished 成功回调
 @param failed 失败回调
 */
- (GXSessionRequest *)GETWithHost:(NSString *)host headers:(NSDictionary *)headers finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed{
    NSMutableURLRequest * request = [self requestWithHost:host method:GXRequestMethodGet Headers:headers parametersType:GXParametersTypeJson parameters:nil];
    self.dataTask = [self dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        [self dataTaskCompletionHandlerWithError:error response:response responseObject:responseObject finished:finished failed:failed];
    }];
    [self.dataTask resume];
    return self;
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
    NSMutableURLRequest * request = [self requestWithHost:host method:GXRequestMethodPost Headers:headers parametersType:GXParametersTypeJson parameters:parameters];
    self.dataTask = [self dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        [self dataTaskCompletionHandlerWithError:error response:response responseObject:responseObject finished:finished failed:failed];
    }];
    return self;
}

/**
 发起PUT请求
 
 @param host 主机url
 @param headers 请求头
 @param parameters 请求体
 @param finished 成功回调
 @param failed 失败回调
 */
- (GXSessionRequest *)PUTWithHost:(NSString *)host headers:(NSDictionary *)headers parameters:(NSDictionary *)parameters finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed{
    NSMutableURLRequest * request = [self requestWithHost:host method:GXRequestMethodPut Headers:headers parametersType:GXParametersTypeJson parameters:parameters];
    self.dataTask = [self dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        [self dataTaskCompletionHandlerWithError:error response:response responseObject:responseObject finished:finished failed:failed];
    }];
    return self;
}

/**
 发起DELETE请求
 
 @param host 主机url
 @param headers 请求头
 @param finished 成功回调
 @param failed 失败回调
 */
- (GXSessionRequest *)DELETEWithHost:(NSString *)host headers:(NSDictionary *)headers finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed{
    NSMutableURLRequest * request = [self requestWithHost:host method:GXRequestMethodDelete Headers:headers parametersType:GXParametersTypeJson parameters:nil];
    self.dataTask = [self dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        [self dataTaskCompletionHandlerWithError:error response:response responseObject:responseObject finished:finished failed:failed];
    }];
    [self.dataTask resume];
    return self;
}

#pragma mark -
#pragma mark - Request
- (NSMutableURLRequest *)requestWithHost:(NSString *)host method:(GXRequestMethod)sessionMethod Headers:(NSDictionary *)headers parametersType:(GXParametersType)parameterType parameters:(NSDictionary *)parameters{
    NSString * method = [self methodStringWithSessionMethod:sessionMethod];
    NSError * error = nil;
    NSMutableURLRequest * request;
    if(parameterType == GXParametersTypeText){
        request = [[AFJSONRequestSerializer serializer] requestWithMethod:method URLString:host parameters:nil error:&error];
    }else{
        request = [[AFJSONRequestSerializer serializer] requestWithMethod:method URLString:host parameters:parameters error:&error];
    }
    if(error){
        NSLog(@"create request error:\n%@",error);
        return request;
    }
    if(headers != nil && headers.allKeys.count > 0){
        for (NSString * key in headers.allKeys) {
            [request setValue:headers[key] forHTTPHeaderField:key];
        }
    }
//   body以text形式发送
    if(parameterType == GXParametersTypeText){
        NSMutableString * body = [[NSMutableString alloc]init];
        for(NSInteger i=0;i<parameters.allKeys.count;i++){
            NSString * key = parameters.allKeys[i];
            NSString * value = parameters[key];
            if(i != 0){
                [body appendString:@"&"];
            }
            [body appendString:[NSString stringWithFormat:@"%@=%@",key,value]];
        }
        NSLog(@"post body:\n%@",body);
        NSData * bodyData = [body dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:bodyData];
    }else{
//        body以json形式发送
        return request;
    }
    return request;
}

/**
 请求完成后回调操作
 
 @param error 请求是否发生错误
 @param response 响应头
 @param responseObject 相应体
 @param finished 成功回调
 @param failed 失败回调
 */
- (void)dataTaskCompletionHandlerWithError:(NSError *)error response:(NSURLResponse * _Nonnull)response responseObject:(id  _Nullable)responseObject finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed{
    @try {
        if(error){
            if(failed){
                failed(response,responseObject);
            }
        }else{
            if(finished){
                finished(response,responseObject);
            }
        }
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

#pragma mark -
#pragma mark - dataTask

/**
 请求任务dataTask

 @param request 请求
 @param completionHandler 结束回调
 @return 请求任务dataTask
 */
- (NSURLSessionDataTask *)dataTaskWithRequest:(NSMutableURLRequest *)request completionHandler:(void (^) (NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error))completionHandler{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain", nil];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    NSURLSessionDataTask * dataTask = [manager dataTaskWithRequest:request completionHandler:completionHandler];
    [dataTask resume];
    return dataTask;
}

#pragma mark -
#pragma mark - Method
/**
 返回请求方式
 GET POST PUT DELETE
 
 @param method 请求方式
 @return 请求方式字符串
 */
- (NSString *)methodStringWithSessionMethod:(GXRequestMethod)method{
    NSString * MethodStr = @"GET";
    if(method == GXRequestMethodGet){
        MethodStr = @"GET";
    }else if (method == GXRequestMethodPost){
        MethodStr = @"POST";
    }else if (method == GXRequestMethodPut){
        MethodStr = @"PUT";
    }else if (method == GXRequestMethodDelete){
        MethodStr = @"DELETE";
    }
    return MethodStr;
}


@end

//
//  GXNetworking.h
//  BJNewsUtils
//
//  Created by wolffy on 2020/12/25.
//  Copyright © 2020 光线传媒. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GXSessionRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface GXNetworking : NSObject

+ (GXNetworking *)defaultManager;

#pragma mark -
#pragma mark - 基础 GET POST PUT DELETE

#pragma mark - GET

/**
 *  发起GET请求
 *  参数：无
 *
 * @param host 主机名
 * @param finished 成功回调
 * @param failed 失败回调
 */
- (GXSessionRequest *)GETWithHost:(NSString *)host finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed;

/**
 * 发起GET请求
 * 参数：headers
 *
 * @param host 主机url
 * @param headers 请求头
 * @param finished 成功回调
 * @param failed 失败回调
 */
- (GXSessionRequest *)GETWithHost:(NSString *)host headers:(NSDictionary *)headers finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed;

/**
 *  发起GET请求，带query参数
 *  参数：query+headers
 *
 * @param host 主机名
 * @param query query参数
 * @param headers 请求头
 * @param finished 成功回调
 * @param failed 失败回调
 */
- (GXSessionRequest *)GETWithHost:(NSString *)host query:(NSDictionary *)query headers:(NSDictionary *)headers finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed;



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
- (GXSessionRequest *)POSTWithHost:(NSString *)host parameters:(NSDictionary *)parameters finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed;

/**
 * 发起POST请求
 * 参数：headers + parameters
 *
 * @param host 主机url
 * @param headers 请求头
 * @param parameters 请求体
 * @param finished 成功回调
 * @param failed 失败回调
 */
- (GXSessionRequest *)POSTWithHost:(NSString *)host headers:(NSDictionary *)headers parameters:(NSDictionary *)parameters finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed;

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
- (GXSessionRequest *)POSTWithHost:(NSString *)host query:(NSDictionary *)query headers:(NSDictionary *)headers parameters:(NSDictionary *)parameters finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed;

#pragma mark - PUT
/**
 发起PUT请求
 
 @param host 主机url
 @param headers 请求头
 @param parameters 请求体
 @param finished 成功回调
 @param failed 失败回调
 */
- (GXSessionRequest *)PUTWithHost:(NSString *)host headers:(NSDictionary *)headers parameters:(NSDictionary *)parameters finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed;

#pragma mark - DELETE
/**
 发起DELETE请求
 
 @param host 主机url
 @param headers 请求头
 @param finished 成功回调
 @param failed 失败回调
 */
- (GXSessionRequest *)DELETEWithHost:(NSString *)host headers:(NSDictionary *)headers finished:(void (^)(NSURLResponse * response,NSData * responseData))finished failed:(void (^) (NSURLResponse * response,NSData * responseData))failed;

@end

NS_ASSUME_NONNULL_END

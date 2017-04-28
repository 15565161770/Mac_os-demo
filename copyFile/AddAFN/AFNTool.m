//
//  AFNTool.m
//  cn.wenqian.cloudScreen
//
//  Created by Apple on 17/2/6.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

#import "AFNTool.h"

@implementation AFNTool


/**
 post 请求
 */
//+ (void)postWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure
//{
//    
//    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
////    sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
////    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    
//    [sessionManager POST:path parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if (success) {
//            success(responseObject);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        if (error) {
//            failure(error);
//        }
//    }];
//
//}
//
//
///**
// *  get  请求
// */
//+ (void)getWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure
//{
//    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
////    sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
////    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
//
//    [sessionManager GET:path parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if (success) {
//            success(responseObject);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        if (error) {
//            failure(error);
//        }
//    }];
//    
//}

//   获取token值  post  请求
+ (void)postWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}


/**
 *  get  请求
 */
+ (void)getWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}


@end

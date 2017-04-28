//
//  AFNTool.h
//  cn.wenqian.cloudScreen
//
//  Created by Apple on 17/2/6.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
typedef void (^HttpSuccessBlock)(id JSON);
typedef void (^HttpFailureBlock)(NSError *error);
@interface AFNTool : NSObject

/**
 post 请求
 */
+ (void)postWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure;

/**
 get请求
 */
+ (void)getWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure;

@end

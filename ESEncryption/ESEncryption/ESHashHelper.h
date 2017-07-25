//
//  ESHashHelper.h
//  ESEncryption
//
//  Created by codeLocker on 2017/7/25.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESHashHelper : NSObject
/**
 返回结果：32长度(128位，16字节，16进制字符输出则为32字节长度)   终端命令：md5 -s "123"
 */
+ (NSString *)md5Hash:(NSString *)string;

/**
 返回结果：40长度   终端命令：echo -n "123" | openssl sha -sha1
 */
+ (NSString *)sha1Hash:(NSString *)string;

/**
 返回结果：56长度   终端命令：echo -n "123" | openssl sha -sha224
 */
+ (NSString *)sha224Hash:(NSString *)string;

/**
 返回结果：64长度   终端命令：echo -n "123" | openssl sha -sha256
 */
+ (NSString *)sha256Hash:(NSString *)string;

/**
 返回结果：96长度   终端命令：echo -n "123" | openssl sha -sha384
 */
+ (NSString *)sha384Hash:(NSString *)string;

/**
 返回结果：128长度   终端命令：echo -n "123" | openssl sha -sha512
 */
+ (NSString *)sha512Hash:(NSString *)string;

#pragma mark - HMAC

/// 返回结果：32长度  终端命令：echo -n "123" | openssl dgst -md5 -hmac "123"
+ (NSString *)hmacMD5:(NSString *)string key:(NSString *)key;

/// 返回结果：40长度   echo -n "123" | openssl sha -sha1 -hmac "123"
+ (NSString *)hmacSHA1:(NSString *)string key:(NSString *)key;
+ (NSString *)hmacSHA224:(NSString *)string key:(NSString *)key;
+ (NSString *)hmacSHA256:(NSString *)string key:(NSString *)key;
+ (NSString *)hmacSHA384:(NSString *)string key:(NSString *)key;
+ (NSString *)hmacSHA512:(NSString *)string key:(NSString *)key;
@end

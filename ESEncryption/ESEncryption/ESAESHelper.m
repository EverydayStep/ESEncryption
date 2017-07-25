//
//  ESAESHelper.m
//  ESEncryption
//
//  Created by codeLocker on 2017/7/25.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import "ESAESHelper.h"
#import <CommonCrypto/CommonCrypto.h>
#import <ESUtils/ESUtils.h>
#import <GTMBase64/GTMBase64.h>

@implementation ESAESHelper

+ (NSString *)encryptString:(NSString *)string key:(NSString *)key iv:(NSString *)iv {
    if (![ESUtils isLegalString:string] || ![ESUtils isLegalString:key]) {
        return nil;
    }
    NSData *ivData = [iv dataUsingEncoding:NSUTF8StringEncoding];
    if ([ivData length] != 16) {
        //iv长度必须为16
        NSLog(@"AES CBC加密 iv长度必须为16");
        return nil;
    }
    NSData *result = [self encrypt:[string dataUsingEncoding:NSUTF8StringEncoding] key:[key dataUsingEncoding:NSUTF8StringEncoding] iv:ivData];
    return [GTMBase64 stringByEncodingData:result];
}

+ (NSString *)decryptString:(NSString *)string key:(NSString *)key iv:(NSString *)iv {
    if (![ESUtils isLegalString:string] || ![ESUtils isLegalString:key]) {
        return nil;
    }
    NSData *ivData = [iv dataUsingEncoding:NSUTF8StringEncoding];
    if ([ivData length] != 16) {
        //iv长度必须为16
        NSLog(@"AES CBC加密 iv长度必须为16");
        return nil;
    }
    NSData *result = [self decrypt:[GTMBase64 decodeString:string] key:[key dataUsingEncoding:NSUTF8StringEncoding] iv:ivData];
    return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
}

+ (NSString *)encryptString:(NSString *)string key:(NSString *)key {
    if (![ESUtils isLegalString:string] || ![ESUtils isLegalString:key]) {
        return nil;
    }
    NSData *result = [self encrypt:[string dataUsingEncoding:NSUTF8StringEncoding] key:[key dataUsingEncoding:NSUTF8StringEncoding] iv:NULL];
    return [GTMBase64 stringByEncodingData:result];
}


+ (NSString *)decryptString:(NSString *)string key:(NSString *)key {
    if (![ESUtils isLegalString:string] || ![ESUtils isLegalString:key]) {
        return nil;
    }
    NSData *result = [self decrypt:[GTMBase64 decodeString:string] key:[key dataUsingEncoding:NSUTF8StringEncoding] iv:NULL];
    return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
}

/**
 加密

 @param data 待加密数据
 @param key key
 @param iv iv
 @return 加密后的数据
 */
+ (NSData *)encrypt:(NSData *)data key:(NSData *)key iv:(NSData *)iv
{
    if (key.length != 16 && key.length != 24 && key.length != 32) {
        NSLog(@"AES加密 key长度必须为16、24或者32");
        return nil;
    }
    
    NSUInteger dataLength = [data length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          [key bytes],
                                          [key length],
                                          [iv bytes],/* 初始化向量(可选) */
                                          [data bytes],
                                          dataLength,/*输入*/
                                          buffer,
                                          bufferSize,/* 输出 */
                                          &numBytesEncrypted);
    
    if (cryptStatus == kCCSuccess) {
        NSData *result = [NSData dataWithBytes:buffer length:numBytesEncrypted];
        free(buffer);//释放buffer
        return result;
    }
    free(buffer);//释放buffer
    return nil;
}

/**
 解密

 @param data 待解密数据
 @param key key
 @param iv iv
 @return 解密后的数据
 */
+ (NSData *)decrypt:(NSData *)data key:(NSData *)key iv:(NSData *)iv
{
    if (key.length != 16 && key.length != 24 && key.length != 32) {
        NSLog(@"AES加密 key长度必须为16、24或者32");
        return nil;
    }
    
    NSUInteger dataLength = [data length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding| kCCOptionECBMode,
                                          [key bytes],
                                          [key length],
                                          [iv bytes],/* 初始化向量(可选) */
                                          [data bytes],
                                          dataLength,/* 输入 */
                                          buffer, bufferSize,/* 输出 */
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *result = [NSData dataWithBytes:buffer length:numBytesDecrypted];
        free(buffer);
        return result;
    }
    free(buffer);//释放buffer
    return nil;
}
@end

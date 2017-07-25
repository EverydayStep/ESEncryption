//
//  ESHashHelper.m
//  ESEncryption
//
//  Created by codeLocker on 2017/7/25.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import "ESHashHelper.h"
#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonHMAC.h>
#import <ESUtils/ESUtils.h>

@implementation ESHashHelper
+ (NSString *)md5Hash:(NSString *)string {
    if (![ESUtils isLegalString:string]) {
        return nil;
    }
    const char *plain = string.UTF8String;
    unsigned char *digest;
    digest = malloc(CC_MD5_DIGEST_LENGTH);
    
    CC_MD5(plain, (CC_LONG)strlen(plain), digest);
    
    NSString *encode = [self stringFromBytes:digest length:CC_MD5_DIGEST_LENGTH];
    free(digest);
    return encode;
}

+ (NSString *)sha1Hash:(NSString *)string {
    if (![ESUtils isLegalString:string]) {
        return nil;
    }
    const char *plain = string.UTF8String;
    unsigned char *digest;
    digest = malloc(CC_SHA1_DIGEST_LENGTH);

    CC_SHA1(plain, (CC_LONG)strlen(plain), digest);

    NSString *encode = [self stringFromBytes:digest length:CC_SHA1_DIGEST_LENGTH];
    free(digest);
    return encode;
}

+ (NSString *)sha224Hash:(NSString *)string {
    if (![ESUtils isLegalString:string]) {
        return nil;
    }
    const char *str = string.UTF8String;
    unsigned char *digest;
    digest = malloc(CC_SHA224_DIGEST_LENGTH);

    CC_SHA224(str, (CC_LONG)strlen(str), digest);

    NSString *encode = [self stringFromBytes:digest length:CC_SHA224_DIGEST_LENGTH];
    free(digest);
    return encode;
}

+ (NSString *)sha256Hash:(NSString *)string {
    if (![ESUtils isLegalString:string]) {
        return nil;
    }
    const char *str = string.UTF8String;
    unsigned char *digest;
    digest = malloc(CC_SHA256_DIGEST_LENGTH);

    CC_SHA256(str, (CC_LONG)strlen(str), digest);

    NSString *encode = [self stringFromBytes:digest length:CC_SHA256_DIGEST_LENGTH];
    free(digest);
    return encode;
}

+ (NSString *)sha384Hash:(NSString *)string {
    if (![ESUtils isLegalString:string]) {
        return nil;
    }
    const char *str = string.UTF8String;
    unsigned char *digest;
    digest = malloc(CC_SHA384_DIGEST_LENGTH);

    CC_SHA384(str, (CC_LONG)strlen(str), digest);

    NSString *encode = [self stringFromBytes:digest length:CC_SHA384_DIGEST_LENGTH];
    free(digest);
    return encode;
}

+ (NSString *)sha512Hash:(NSString *)string {
    if (![ESUtils isLegalString:string]) {
        return nil;
    }
    const char *str = string.UTF8String;
    unsigned char *digest;
    digest = malloc(CC_SHA512_DIGEST_LENGTH);

    CC_SHA512(str, (CC_LONG)strlen(str), digest);

    NSString *encode = [self stringFromBytes:digest length:CC_SHA512_DIGEST_LENGTH];
    free(digest);
    return encode;
}

#pragma mark - HMAC
+ (NSString *)hmacMD5:(NSString *)string key:(NSString *)key {
    if (![ESUtils isLegalString:string] || ![ESUtils isLegalString:key]) {
        return nil;
    }
    const char *keyData = key.UTF8String;
    const char *strData = string.UTF8String;
    uint8_t buffer[CC_MD5_DIGEST_LENGTH];

    CCHmac(kCCHmacAlgMD5, keyData, strlen(keyData), strData, strlen(strData), buffer);
    return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH];
}

+ (NSString *)hmacSHA1:(NSString *)string key:(NSString *)key {
    if (![ESUtils isLegalString:string] || ![ESUtils isLegalString:key]) {
        return nil;
    }
    NSData *hashData = [string dataUsingEncoding:NSUTF8StringEncoding];

    unsigned char *digest;
    digest = malloc(CC_SHA1_DIGEST_LENGTH);
    const char *cKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), [hashData bytes], [hashData length], digest);

    NSString *encode = [self stringFromBytes:digest length:CC_SHA1_DIGEST_LENGTH];
    free(digest);
    cKey = nil;
    return encode;
}

+ (NSString *)hmacSHA224:(NSString *)string key:(NSString *)key {
    if (![ESUtils isLegalString:string] || ![ESUtils isLegalString:key]) {
        return nil;
    }
    NSData *hashData = [string dataUsingEncoding:NSUTF8StringEncoding];

    unsigned char *digest;
    digest = malloc(CC_SHA224_DIGEST_LENGTH);
    const char *cKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    CCHmac(kCCHmacAlgSHA224, cKey, strlen(cKey), [hashData bytes], [hashData length], digest);

    NSString *encode = [self stringFromBytes:digest length:CC_SHA224_DIGEST_LENGTH];
    free(digest);
    cKey = nil;
    return encode;
}

+ (NSString *)hmacSHA256:(NSString *)string key:(NSString *)key {
    if (![ESUtils isLegalString:string] || ![ESUtils isLegalString:key]) {
        return nil;
    }
    NSData *hashData = [string dataUsingEncoding:NSUTF8StringEncoding];

    unsigned char *digest;
    digest = malloc(CC_SHA256_DIGEST_LENGTH);
    const char *cKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), [hashData bytes], [hashData length], digest);

    NSString *encode = [self stringFromBytes:digest length:CC_SHA256_DIGEST_LENGTH];
    free(digest);
    cKey = nil;
    return encode;
}

+ (NSString *)hmacSHA384:(NSString *)string key:(NSString *)key {
    if (![ESUtils isLegalString:string] || ![ESUtils isLegalString:key]) {
        return nil;
    }
    NSData *hashData = [string dataUsingEncoding:NSUTF8StringEncoding];

    unsigned char *digest;
    digest = malloc(CC_SHA384_DIGEST_LENGTH);
    const char *cKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), [hashData bytes], [hashData length], digest);

    NSString *encode = [self stringFromBytes:digest length:CC_SHA384_DIGEST_LENGTH];
    free(digest);
    cKey = nil;
    return encode;
}

+ (NSString *)hmacSHA512:(NSString *)string key:(NSString *)key {
    if (![ESUtils isLegalString:string] || ![ESUtils isLegalString:key]) {
        return nil;
    }
    NSData *hashData = [string dataUsingEncoding:NSUTF8StringEncoding];

    unsigned char *digest;
    digest = malloc(CC_SHA512_DIGEST_LENGTH);
    const char *cKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    CCHmac(kCCHmacAlgSHA512, cKey, strlen(cKey), [hashData bytes], [hashData length], digest);

    NSString *encode = [self stringFromBytes:digest length:CC_SHA512_DIGEST_LENGTH];
    free(digest);
    cKey = nil;
    return encode;
}

#pragma mark - Bytes转字符串
/**
 字符大小写可以通过修改“%02X”中的x修改,下面采用的是小写
 */
+ (NSString *)stringFromBytes:(uint8_t *)bytes length:(int)length {
    NSMutableString *strM = [NSMutableString string];
    
    for (int i = 0; i < length; i++) {
        [strM appendFormat:@"%02x", bytes[i]];
    }
    return [strM copy];
}

@end

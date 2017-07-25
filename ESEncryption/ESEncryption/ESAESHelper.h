//
//  ESAESHelper.h
//  ESEncryption
//
//  Created by codeLocker on 2017/7/25.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESAESHelper : NSObject
/*
 ECB模式 iv为空
 CBC模式 iv需要传一个16位的向量值
 key的length 只能为16(kCCKeySizeAES128) 24(kCCKeySizeAES192) 32(kCCKeySizeAES256)
*/

//ECB
+ (NSString *)encryptString:(NSString *)string key:(NSString *)key;
+ (NSString *)decryptString:(NSString *)string key:(NSString *)key;

//CBC
+ (NSString *)encryptString:(NSString *)string key:(NSString *)key iv:(NSString *)iv;
+ (NSString *)decryptString:(NSString *)string key:(NSString *)key iv:(NSString *)iv;
@end

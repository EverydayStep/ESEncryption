//
//  ESDESHelper.h
//  ESEncryption
//
//  Created by codeLocker on 2017/7/25.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESDESHelper : NSObject

/**
 加密

 @param string 需要加密内容
 @param key 密钥
 @return 加密后数据
 */
+ (NSString *)encryptString:(NSString *)string key:(NSString *)key;

/**
 解密

 @param string 需要解密内容
 @param key 密钥
 @return 解密后的数据
 */
+ (NSString *)decryptString:(NSString *)string key:(NSString *)key;
@end

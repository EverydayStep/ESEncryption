//
//  ESRSAHelper.h
//  ESEncryption
//
//  Created by codeLocker on 2017/7/25.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESRSAHelper : NSObject

+ (NSString *)encryptString:(NSString *)string publicKey:(NSString *)publicKey;
+ (NSData *)encryptData:(NSData *)data publicKey:(NSString *)publicKey;

+ (NSString *)decryptString:(NSString *)string privateKey:(NSString *)privateKey;
+ (NSData *)decryptData:(NSData *)data privateKey:(NSString *)privateKey;
@end

//
//  ViewController.m
//  ESEncryption
//
//  Created by codeLocker on 2017/7/25.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import "ViewController.h"
#import "ESDESHelper.h"
#import "ESRSAHelper.h"
#import "ESHashHelper.h"
#import "ESAESHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
////    2ae788d97356799
//    NSString *a = [ESAESHelper encrypt:@"123" key:@"42853a61b26fef79"];
//    NSString *b = [ESAESHelper decrypt:a key:@"42853a61b26fef79"];
//    NSLog(@"%@",a);
//    NSLog(@"%@",b);
    
    
//    NSString *a = [ESAESHelper encryptString:@"123" key:@"42853a61b26fef79" iv:@"42853a61b26fef79"];
//    NSString *b = [ESAESHelper decryptString:a key:@"42853a61b26fef79" iv:@"42853a61b26fef79"];
//    NSLog(@"%@",a);
//    NSLog(@"%@",b);
    
//    NSString *a = [ESAESHelper encryptString:@"123" key:@"42853a61b26fef7942853a61b26fef79"];
//    NSString *b = [ESAESHelper decryptString:a key:@"42853a61b26fef7942853a61b26fef79"];
//    NSLog(@"%@",a);
//    NSLog(@"%@",b);
    
    
//    NSLog(@"%@",[ESHashHelper md5Hash:@"123"]);
//    NSLog(@"%@",[ESMD5Helper MD5:@"123"]);
//
//    NSString *des = [ESDESHelper encrypt:@"123" key:@"01234567"];
//    NSString *ciDes = [ESDESHelper decrypt:@"MV5dUGKtzbM=" key:@"01234567"];
//    
//    NSLog(@"%@\n%@",des,ciDes);
    
//    NSString *publicKey = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQD0kQHippIvpZmzrGHcGEJUXw4uAXlkXQMfNG4CzV+WAzpU0rRJDr345n0XV/8ipnfQmIrCjcVuW1rmYL6P1SVuOZaLI0dDG0+GM3nkxQXi+HbSSe/weWoG/ywjrhoTJsvn45s2Rybg99p1pDJYZ6iBrZ4Y0gfrzZzxhTTLsgjYdQIDAQAB";
//    NSString *privateKey = @"MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAPSRAeKmki+lmbOsYdwYQlRfDi4BeWRdAx80bgLNX5YDOlTStEkOvfjmfRdX/yKmd9CYisKNxW5bWuZgvo/VJW45losjR0MbT4YzeeTFBeL4dtJJ7/B5agb/LCOuGhMmy+fjmzZHJuD32nWkMlhnqIGtnhjSB+vNnPGFNMuyCNh1AgMBAAECgYB62jDBQv1iM+SezfQmlIUVTt6Xm6P4F4UO8s5kV/gxKhPuMh3gKSii1F14EXsXU9oSDd5+VqsbgYaK/YQcSmzPE3m36aDmAa8k2at8BpiAwM9vVsacb2YLpXPkDPWD2NqBhYyqqBrM2zWW/D/37LHemzvFGjPpegQ0NpcCCE4Q7QJBAPppHl0hdSZa0OivcepXPJalo56bg1vxkLmbXyO1KKTbNE3Qk28dLBenS5fcrxL/HlVQw3xFBPRyOWcXUyOCb6MCQQD6Bn6IOjJP1ccxw7GJmIQkHo3jF98TO7zETjMaiX0t4nfZFdKPdYwM+r8YfzdPn9ItnZq24sdi6rQtPPOuubkHAkAwesl2HlQf6NUpN05GoD0KrWbP/iugUVRDmuEAeMI1qHqn1gm1KWCv86Oe8wqyEtI8kjZGiNY8vSB/5PQjm80hAkAWPN+iNDLnYOc/qN0wlM0j/Ue3bBceOdD3UNFAyfvFSgBI4aUBt33GZcL7Zc1AmsFx5zOsko0TYja2U1aFMuWfAkBb/6/mZ1EOwEnnpqYIL7jcU0nG+giXvFJ+i3nEA7x2wjSX3A4j+c8/ayqtZ7N/C22Ce5c4UunZ3ozlMN2qUFA9";
//    
//    NSString *a = [ESRSAHelper encryptString:@"xuzhang" publicKey:publicKey];
//    NSString *b = [ESRSAHelper decryptString:a privateKey:privateKey];
//    NSLog(@"%@\n%@",a,b);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

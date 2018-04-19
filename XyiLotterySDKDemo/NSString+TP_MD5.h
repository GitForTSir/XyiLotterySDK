//
//  NSString+TP_MD5.h
//  XyiSDK!
//
//  Created by xiandao on 2018/4/3.
//  Copyright © 2018年 xiandao. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import <UIKit/UIKit.h>

@interface NSString (TP_MD5)
- (NSString *)md5Encrypt;
@end

//
//  NSString+TP_MD5.m
//  XyiSDK!
//
//  Created by xiandao on 2018/4/3.
//  Copyright © 2018年 xiandao. All rights reserved.
//

#import "NSString+TP_MD5.h"

@implementation NSString (TP_MD5)
- (NSString *)md5Encrypt {
    
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
@end

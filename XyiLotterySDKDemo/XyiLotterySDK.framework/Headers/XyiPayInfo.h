//
//  XyiPayInfo.h
//  SDK_CP
//
//  Created by xiandao on 2018/2/23.
//  Copyright © 2018年 xiandao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XyiPayInfo : NSObject
/**
 * 渠道商用户Id
 */
@property (nonatomic,strong) NSString *merUserId;
/**
 * 从服务器获取的最新余额
 */
@property (nonatomic,strong) NSString *amount;
/**
 * 签名，Java服务器签名规则（String signSrc = "partnerId=" + tm.getStoreId()+"#" + "skey=" + key+ "#" + "userId=" + tm.getUserId()+"#"
 + "amount=" + tm.getAmount();
 String sign = MD5.encodeString(signSrc, "UTF-8");）
 */
@property (nonatomic,strong) NSString *sign;
/**
 * 预支付订单（可选，默认为空）
 */
@property (nonatomic,strong) NSString *payId;

@end

//
//  ViewController.m
//  XyiLotterySDKDemo
//
//  Created by xiandao on 2018/4/7.
//  Copyright © 2018年 xiandao. All rights reserved.
//

#import "ViewController.h"
#import <XyiLotterySDK/XyiLotterySDK.h>
#import "NSString+TP_MD5.h"

#define iPhoneX [UIScreen mainScreen].bounds.size.height == 812.0
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
//    NSLog(@"%@",NSHomeDirectory());
    [super viewDidLoad];
    CGRect showFrame = CGRectZero;
    if (iPhoneX) {
        showFrame = CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44 - 34);
    }else{
        showFrame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20);
    }
    
    if (@available(iOS 9.0, *)) {
        
    [XyiLotterySDK xyiLotteryAddSDKToView:self.view setupShowFrame:showFrame delegate:self];
        
    }
}


/**
 支付回调,在此代理中给SDK传必要的参数
 
 @param completionHandle block回调
 */
-(void)xyiLotterySDK:(void (^)(XyiPayInfo *))completionHandle{
    
    //模拟网络请求后返回必要的参数（amount，sign 。。。）此数据皆由你们服务器提供 此处数据只用来模拟
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSString *sdkPartnerId=@"9801000";                    //向我司申请获得
        NSString *skey=@"0JBM3HYBNJJ4T5C6RSXZ1HVH9S8QCY4A";   //向我司申请获得
        NSString *merUserId=@"yourMerUserID";                 //渠道商用户ID
        NSString *amount=@"1000000";                          //用户余额
        
        NSString *signSrc = [NSString stringWithFormat:@"partnerId=%@#skey=%@#merUserId=%@#amount=%@",sdkPartnerId,skey,merUserId,amount];
        NSString *MD5SignSrc = [[signSrc md5Encrypt] lowercaseString];
    
        // 创建 XyiPayInfo 对象,并将你们服务器获得的参数值对以下三个属性一一赋值（参数值均由你们服务器获得）,completionHandle(XyiPayInfo对象)
        XyiPayInfo *info  = [[XyiPayInfo alloc] init];
        info.merUserId    = merUserId;
        info.amount       = amount;
        info.sign         = MD5SignSrc;
        
        completionHandle(info);
    });
}



/**
 支付结果回调
 
 @param PayResp 回调信息,用户自行查看和利用
 */
-(void)xyiLotterySDKShowPayResp:(NSDictionary*)PayResp{
    
}





- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end

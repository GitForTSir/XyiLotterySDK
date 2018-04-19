//
//  XyiLotterySDK.h
//  SDK_CP
//
//  Created by xiandao on 2018/2/7.
//  Copyright © 2018年 xiandao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XyiPayInfo.h"


typedef NS_ENUM(NSInteger,NetWorkEnvironment){

    NetWorkDebug = 1,  //开发环境

    NetWorkProduct     //生产环境
    
};

@class XyiLotterySDK;

@protocol XyiLotterySDKDelegate <NSObject>

@required

/**
 支付代理，传入最新的余额amount,userId,和按规则拼接加密的sigh

 @param completionHandle 回调 completionHandle(payInfo);
 */
-(void)xyiLotterySDK:(void(^)(XyiPayInfo* payInfo))completionHandle;
@optional

/**
 用户信息回调，包括支付结果，用户可以自行利用PayResp中的信息

 @param PayResp 支付结果
 */
-(void)xyiLotterySDKShowPayResp:(NSDictionary*)PayResp;

@end


@interface RegisteResp :NSObject
@property (nonatomic,assign,readonly) BOOL isRegisteSuccess;  //是否注册成功
@property (nonatomic,strong,readonly) NSString *clientType;  //客户端类型
@property (nonatomic,strong,readonly) NSString *sdkVersion; //SDK版本
@property (nonatomic,strong,readonly) NSString *sdkSrcUrl; //资源下载地址
@property (nonatomic,assign,readonly) BOOL isForceUpdate; //是否更新
@property (nonatomic,assign,readonly) BOOL isAuditState; //是否审核

@end

@interface XyiLotterySDK : NSObject


/**
 使用SDK前，需要在第三方APP登录账号成功后注册SDK

 @param sdkPartnerId 渠道商PartnerID
 @param merUserId 渠道商UserId
 @param environment 网络环境  发布到App Store请设置为netWorkProduct 测试阶段请设置为NetWorkDebug
 @param registeResp 注册结果回调，判断isRegisteSuccess，YES注册成功，否则登录不成功，在登录不成功的情况下，在进入SDK后会
                    ，SDK会自动再次注册，如果依旧注册失败，会退出SDK，请检查你的参数是否有效
 
 */
+(void)registeXYCPWithYourSdkPartnerId:(NSString*)sdkPartnerId
                             merUserId:(NSString*)merUserId
                    NetWorkEnvironment:(NetWorkEnvironment)environment
                           registeResp:(void(^)(RegisteResp*registeResp))registeResp API_AVAILABLE(ios(9.0));


/**
 初始化SDK,建议在控制器ViewDidLoad方法中初始化,并隐藏导航栏和TabBar,showFrame的范围不要超过View的Frame,请区分是否为iPhone X
 给与不同的Frame

 @param view 用来显示的View (建议直接传控制器View)
 @param showFrame SDK 的Frame
 @param delegate 代理
 */
+(void)xyiLotteryAddSDKToView:(UIView*)view setupShowFrame:(CGRect)showFrame delegate:(id)delegate API_AVAILABLE(ios(9.0));


/**
 是否显示网页加载进度条，默认显示加载进度条
 */
+(void)setisHidenProgressView:(BOOL)isHiden API_AVAILABLE(ios(9.0));

/**
 设置页面加载进度条已走过进度的进度条颜色和未走过进度的进度条颜色，默认ProgressTintColor为蓝色，TrackTintColor为灰色
 （iOS9设备此设置无效）;
 
 @param progressTintColor 已走过进度的进度条颜色
 @param trackTintColor 未走过进度的进度条颜色
 */
+(void)setProgressTintColor:(UIColor*)progressTintColor
          andTrackTintColor:(UIColor*)trackTintColor API_AVAILABLE(ios(10.0));



@end


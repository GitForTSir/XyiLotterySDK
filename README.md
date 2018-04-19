# XyiLotterySDK
Here, you can realize your billionaire dream.

> ###彩票SDK文档

######1.1 SDK环境手动部署,设置Build Settings -> Other Linker Flags 添加 -licucore和-all_load，设置info.plist文件，允许http请求
######1.2 SDK环境自动部署，使用cocoapods自动部署,在podfile文件pod 'XyiLotterySDK',安装，项目中导入即可使用(如何用cocoapods部署此处不做详细介绍)
######2. SDK支持iOS9.0以上系统 （建议用最新xcode使用SDK）
######3. 因SDK为彩票类产品,故上架App Store会被拒绝,商户可通过后台管理系统自行配置相关设置以避开审核
######4. SDK demo中已经给与测试环境下渠道商id和对应的skey，上架App Store前，请改为生成环境下的渠道商id和对应的skey，由我司为你提供
#####1.注册SDK

API说明

```
/**
使用SDK前，需要在第三方APP登录账号成功后注册SDK

@param sdkPartnerId 渠道商PartnerID
@param merUserId 渠道商UserId
@param environment 网络环境  发布到App Store请设置为NetWorkProduct 测试阶段请设置为NetWorkDebug
@param registeResp 注册结果回调，判断isRegisteSuccess，YES注册成功，否则登录不成功，在登录不成功的情况下，在进入SDK后会
，SDK会自动再次注册，如果依旧注册失败，会退出SDK，请检查你的参数是否有效

*/
+(void)registeXYCPWithYourSdkPartnerId:(NSString*)sdkPartnerId
merUserId:(NSString*)merUserId
NetWorkEnvironment:(NetWorkEnvironment)environment
registeResp:(void(^)(RegisteResp*registeResp))registeResp API_AVAILABLE(ios(9.0));

```
示例代码

```
//第三方APP登录账号成功后注册SDK,#import <XyiLotterySDK/XyiLotterySDK.h>
-(void)yourAPPRegisterSuccess{
if (@available(iOS 9.0, *)){
[XyiLotterySDK registeXYCPWithYourSdkPartnerId:@"9801000"         //此处partnerId为测试环境用
merUserId:@"yourMerUserID"   //渠道商用户id
NetWorkEnvironment:NetWorkDebug       //发布到App Store改为NetWorkProduct
registeResp:^(RegisteResp *registeResp) {

if (registeResp.isRegisteSuccess) {
NSLog(@"登录成功");
}else{
NSLog(@"登录失败");
//在登录失败的情况下是不允许进入SDK的,
}
}];
}
}

```

#####2.初始化SDK

API说明

```
/**
初始化SDK,建议在控制器ViewDidLoad方法中初始化,并隐藏导航栏和TabBar,showFrame的范围不要超过View的Frame,请区分是否为iPhone X
给与不同的Frame,用户可自行设置符合需求的Frame

@param view 用来显示的View (建议直接传控制器View)
@param showFrame SDK 的Frame
@param delegate 代理
*/
+(void)xyiLotteryAddSDKToView:(UIView*)view setupShowFrame:(CGRect)showFrame delegate:(id)delegate;


```

示例代码

```
#import <XyiLotterySDK/XyiLotterySDK.h>

- (void)viewDidLoad {
[super viewDidLoad];

if (iPhone X) {
showFrame = CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44 - 34);
}else{
showFrame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20);

}
[XyiLotterySDK xyiLotteryAddSDKToView:self.view setupShowFrame:showFrame delegate:self];
}


```

#####3.支付相关代理

API说明

```
@protocol XyiLotterySDKDelegate <NSObject>

@required

/**
支付代理，当发起支付后传入最新的余额amount,和按规则拼接加密的sigh; amount, 
sigh 参数均由你们后台提供

@param completionHandle 回调 completionHandle(payInfo);
*/
-(void)xyiLotterySDK:(void(^)(XyiPayInfo* payInfo))completionHandle;

@optional

/**
支付回调，包括支付结果，用户可以自行利用PayResp中的信息

@param PayResp 支付结果
*/
-(void)xyiLotterySDKShowPayResp:(NSDictionary*)PayResp;

@end

```

示例代码

```
遵守XyiLotterySDKDelegate协议,实现代理方法
//@required 
-(void)xyiLotterySDK:(void (^)(XyiPayInfo *))completionHandle{

//模拟网络请求后返回必要的余额 此处数据均为模拟用

dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
NSString *sdkPartnerId=@"yourSdkPartnerId";
NSString *skey        =@"yourSkey";
NSString *merUserId   =@"yourMerUserId";
NSString *amount      =@"yourAmount";
/**signSrc字段有你们服务器提供,此处用于测试*/
NSString *signSrc     = [NSString stringWithFormat:@"partnerId=%@#skey=%@#merUserId=%@#amount=%@",sdkPartnerId,skey,merUserId,amount];
//MD5加密
NSString *MD5SignSrc  = [[signSrc md5Encrypt] lowercaseString];

/**创建XyiPayInfo并设置amount，sign*/
XyiPayInfo *info = [[XyiPayInfo alloc] init];
info.amount      = amount;       //用户余额
info.sign        = MD5SignSrc;   //加密sign
completionHandle(info);     
});
}

//支付结果回调
-(void)xyiLotterySDKShowPayResp:(NSDictionary *)PayResp{

("0000", "处理成功"), 
("9999", "未知错误"), 
("0010", "不存在的来源"), 
("0015", "错误的摘要信息"), 
("0020", "渠道用户错误或Token错误"),
("0021", "参数签名错误");

}

```
#####4.SDK其他设置

API说明

```
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


```
示例代码

```
- (void)viewDidLoad {
[super viewDidLoad];
[XyiLotterySDK xyiLotteryAddSDKToView:self.view setupShowFrame:showFrame delegate:self];
[XyiLotterySDK setisHidenProgressView:NO];
[XyiLotterySDK setProgressTintColor:[UIColor redColor] andTrackTintColor:[UIColor blueColor]];
}

```

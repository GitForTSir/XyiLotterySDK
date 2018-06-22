//
//  AppDelegate.m
//  XyiLotterySDKDemo
//
//  Created by xiandao on 2018/4/7.
//  Copyright © 2018年 xiandao. All rights reserved.
//

#import "AppDelegate.h"
#import <XyiLotterySDK/XyiLotterySDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //此处模拟渠道商APP账户登录成功后注册XyiLotterySDK,在你的项目中,要把注册XyiLotterySDK放到渠道商用户登录成功后
    if (@available(iOS 9.0, *)){
        [XyiLotterySDK registeXYCPWithYourSdkPartnerId:@"9801000"
                                             merUserId:@"youMerUserID"
                                    NetWorkEnvironment:NetWorkDebug
                                           registeResp:^(RegisteResp *registeResp) {
            if (registeResp.isRegisteSuccess) {
                NSLog(@"登录成功");
            }else{
                NSLog(@"登录失败");
                //在登录失败的情况下是不允许进入SDK的,
            }
        }];
    }
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

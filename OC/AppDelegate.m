//
//  AppDelegate.m
//  OC
//
//  Created by apple on 2017/10/18.
//  Copyright © 2017年 shanlq. All rights reserved.
//

#import "AppDelegate.h"
#import "CharacteristicVC.h"
#import "ViewController.h"
#import "RuntimeVC.h"
#import "RunloopVC.h"
#import "GCDViewController.h"
#import "NSOperationVC.h"
#import "KVCViewController.h"
#import "KVOViewController.h"
#import "TestViewController.h"
#import "CreatViewController.h"
#import "ObserverViewController.h"
#import "SonViewController.h"
#import "CommandViewController.h"
#import "StrategyViewController.h"
#import "MediatorViewController.h"
#import "ProxyViewController.h"
#import "CombinationViewController.h"
#import "AdapterViewController.h"
#import "DecorateViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    self.window.rootViewController = [[CharacteristicVC alloc] init];
//    self.window.rootViewController = [[ViewController alloc] init];
//    self.window.rootViewController = [[RuntimeVC alloc] init];
//    self.window.rootViewController = [[RunloopVC alloc] init];
//    self.window.rootViewController = [[GCDViewController alloc] init];
//    self.window.rootViewController = [[NSOperationVC alloc] init];
    self.window.rootViewController = [[KVCViewController alloc] init];
//    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[KVOViewController alloc] init]];
//    self.window.rootViewController = [[TestViewController alloc] init];
//    self.window.rootViewController = [CreatViewController new];
//    self.window.rootViewController = [ObserverViewController new];
//    self.window.rootViewController = [[SonViewController alloc] init];
//    self.window.rootViewController = [[CommandViewController alloc] init];
//    self.window.rootViewController = [[StrategyViewController alloc] init];
//    self.window.rootViewController = [MediatorViewController new];
//    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[ProxyViewController new]];
//    self.window.rootViewController = [[CombinationViewController alloc] init];
//    self.window.rootViewController = [[AdapterViewController alloc] init];
//    self.window.rootViewController = [[DecorateViewController alloc] init];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(TestObserver:) name:@"TestObserver" object:nil];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(void)TestObserver:(NSNotification *)notify
{
    NSLog(@"观察者获取的改变数据：%@", notify.userInfo);
    
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

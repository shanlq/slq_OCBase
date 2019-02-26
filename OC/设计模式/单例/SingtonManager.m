//
//  SingtonManager.m
//  OC
//
//  Created by ZSY on 2018/4/13.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "SingtonManager.h"

@implementation SingtonManager

//单例对象创建过程的宏定义
DJ_SINGLETON_IMP(SingtonManager);

//+(SingtonManager *)sharedInstance
//{
//    static SingtonManager *shareManager = nil;
//    static dispatch_once_t once;
//    dispatch_once(&once, ^{
//        if(!shareManager)
//        {
//            shareManager = [[SingtonManager alloc] init];
//        }
//    });
//    return shareManager;
//}

@end

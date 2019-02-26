//
//  NSArray+empty.m
//  OC
//
//  Created by ZSY on 2018/10/31.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "NSArray+empty.h"
#import <objc/runtime.h>

@implementation NSArray (empty)

//+(void)load方法在编译阶段被执行且只执行一次，保证了方法替换发生在使用之前。
+(void)load
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        SEL customObjectAtIndex = NSSelectorFromString(@"customObjectAtIndex:");                        //自定义方法
        SEL objectAtIndex = NSSelectorFromString(@"objectAtIndex:");                                     //默认方法
        Class target = NSClassFromString(@"__NSArrayI");                        //__NSArrayI才是NSArray真正的类
//        Class target = [self class];       //NSArray是一个类簇（抽象工厂，即会创建对应的抽象子类去发送消息），这里并不能获取到一个抽象工厂类真正的类
        Method customMethod = class_getInstanceMethod(target, customObjectAtIndex);                      //将方法名SEL转化为方法体IMP
        Method defaultMethod = class_getInstanceMethod(target, objectAtIndex);
        method_exchangeImplementations(defaultMethod, customMethod);                                     //交换方法体
    });
}
//自定义方法
-(id)customObjectAtIndex:(int)index
{
    if(index >= self.count)                                                     //数组越界，反馈处理
    {
        @try {
            return [self customObjectAtIndex:index];                        //即调用[self objectAtIndex:index];
        }
        @catch (NSException *exception) {
            // 在崩溃后会打印崩溃信息，方便我们调试。
            NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
            NSLog(@"%@", [exception callStackSymbols]);
            return nil;
        }
        @finally {}
    }
    //即调用[self objectAtIndex:index];而不是调用customObjectAtIndex方法，所以不会形成死循环
    return [self customObjectAtIndex:index];
}

@end

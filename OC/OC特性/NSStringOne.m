//
//  NSStringOne.m
//  OC
//
//  Created by apple on 2017/10/18.
//  Copyright © 2017年 shanlq. All rights reserved.
//

#import "NSStringOne.h"

@implementation NSStringOne

- (NSString *)substringFromIndex:(NSUInteger)from
{
    return @"这是NSString的第一个子类，参数";
}

-(NSString *)substringToIndex:(NSUInteger)to
{
    return @"这是NSString的第一个子类，返回值";
}

- (void)privateFunction
{
    NSLog(@"这个是第一个子类的私有方法");
}

-(NSString *)TestWithDic:(NSDictionary *)dic WithStr:(NSString *)str
{
    NSLog(@"传递的参数是：%@, %@", dic, str);
    return @"slqReturn";
}

@end

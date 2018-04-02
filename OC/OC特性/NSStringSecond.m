//
//  NSStringSecond.m
//  OC
//
//  Created by apple on 2017/10/18.
//  Copyright © 2017年 shanlq. All rights reserved.
//

#import "NSStringSecond.h"

@implementation NSStringSecond

- (NSString *)substringFromIndex:(NSUInteger)from
{
    return @"这是NSString的第二个子类，参数";
}

-(NSString *)substringToIndex:(NSUInteger)to
{
    return @"这是NSString的第二个子类，返回值";
}


@end

//
//  Model.m
//  OC
//
//  Created by apple on 2017/11/25.
//  Copyright © 2017年 shanlq. All rights reserved.
//

#import "Model.h"

@implementation Model

-(NSArray *)WriteWithName:(NSDictionary *)name
{
    return @[@"name", @"slq"];
}
-(BOOL)WriteWithYears:(int)year WithAddress:(NSString *)address
{
    address = @"gz";
    return YES;
}

@end

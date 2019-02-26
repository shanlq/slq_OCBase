//
//  adaptorModel.m
//  OC
//
//  Created by ZSY on 2018/5/17.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "adaptorModel.h"

@implementation adaptorModel
{
    NSString *_name;
    NSString *_year;
}

-(instancetype)initWithName:(NSString *)name year:(NSString *)year
{
    if(self = [super init])
    {
        _name = name;
        _year = year;
    }
    return self;
}

-(NSString *)getPersonName
{
    return _name;
}
-(NSString *)getPersonYear
{
    return _year;
}

@end

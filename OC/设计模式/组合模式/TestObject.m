//
//  TestObject.m
//  OC
//
//  Created by ZSY on 2018/5/16.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "TestObject.h"

@implementation TestObject

-(instancetype)init                                                           //初始化
{
    if(self = [super init])
    {
        _name = @"单家帮";
        _perpons = [NSMutableArray arrayWithCapacity:0];
    }
    return self;
}
#pragma mark comBinationProtocol
-(void)addPerson:(id<comBinationProtocol>)person                            //实现所需的协议方法
{
    [_perpons addObject:person];
}
-(void)removePerson:(id<comBinationProtocol>)person
{
    [_perpons removeObject:person];
}
-(void)gather
{
    for(secondObject *person in _perpons){
        [person gather];
    }
}

@end

@implementation secondObject

-(instancetype)initWithName:(NSString *)name year:(int)year
{
    if(self = [super init])
    {
        _thisName = name;
        _year = year;
    }
    return self;
}
#pragma mark comBinationProtocol
-(void)gather                                                    //这里根据需要则无需实现add方法和remove方法
{
    NSLog(@"成员：%@，%d岁", _thisName, _year);
}

@end

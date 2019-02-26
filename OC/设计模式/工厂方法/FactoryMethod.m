//
//  FactoryMethod.m
//  OC
//
//  Created by ZSY on 2018/4/13.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "FactoryMethod.h"

@implementation Dog
@end

@implementation Cat
@end

@implementation Father

//父类定义基础的对象初始化方法，具体的对象创建过程在子类中完成
-(id)initWithType:(NSString *)type
{
    if(self = [super init])
    {
        self.type = type;
    }
    return self;
}

@end

@implementation FactoryMethod

//该方法即为工厂方法，传入不同的参数 创建并返回不同的类实例对象
-(Father *)createAnimalWithType:(NSString *)type
{
    if([type isEqualToString:@"dog"]){
        return [[Dog alloc] initWithType:@"dog"];              //子类根据接口参数创建具体的对象
    }
    else{
        return [[Cat alloc] initWithType:@"cat"];
    }
}

@end

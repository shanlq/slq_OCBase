//
//  strategy.h
//  OC
//
//  Created by ZSY on 2018/5/8.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 *** 策略模式：定义一系列的算法，把他们一个个封装起来，并使他们可以互相替换，本模式使得算法可以独立于使用它们的客户。
 */

@protocol strategyProtocol                                         //算法协议：用来规定算法类的基础结构、基础方法

-(NSString *)joinToWeak;
-(NSString *)toSchool;
-(NSString *)toTargetAddress;

@end

@interface slq : NSObject<strategyProtocol>                            //算法结构1（例子）
@end

@interface myYl : NSObject<strategyProtocol>                           //算法结构2
@end

@interface thisStrategy : NSObject<strategyProtocol>                       //一系列算法的管理调用者
{
    //因为可能要赋值不同的算法类对象，所以这里用id类型、因为要使用_person调用算法类中重写的协议方法，所以这里的id类型是遵循strategyProtocol协议的id类型即id<strategyProtocol>.
    id<strategyProtocol>_person;
}

-(instancetype)initWithType:(NSString *)type;

@end

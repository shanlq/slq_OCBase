//
//  AbstractFactory.h
//  OC
//
//  Created by ZSY on 2018/4/16.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AbstractFactory : NSObject                            //抽象工厂类（定义公共的对象创建方法）
-(id)CreatPeople;
@end

@interface AbstractManClass : AbstractFactory                   //工厂子类，用来创建具体的数据对象ManUserInfo并进行对应相关操作
-(id)CreatPeople;
@end

@interface AbstractWomanClass : AbstractFactory               //同上，用来创建对象WomanUserInfo
-(id)CreatPeople;
@end

@interface People : NSObject                                      //抽象类（基础父类，用来定义基础信息如name等信息）
@property (nonatomic, strong) NSString *name;
@end

@interface ManUserInfo : People                                      //抽象子类（定义具体的数据对象）
@property (nonatomic, assign) int age;
@end

@interface WomanUserInfo : People
@property (nonatomic, assign) int year;
@end

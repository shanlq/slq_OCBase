//
//  FactoryMethod.h
//  OC
//
//  Created by ZSY on 2018/4/13.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 *** 工厂方法：定义创建对象的接口，让子类决定实例化哪一个类（根据接口参数）。工厂方法使得一个类的实例化延迟到其子类。
 使用：根据接口传入参数的不同，在工厂方法内部创建并返回的不同的类对象。
 */

@interface Father : NSObject

@property (nonatomic, strong) NSString *type;
-(id)initWithType:(NSString *)type;

@end

@interface FactoryMethod : Father

-(Father *)createAnimalWithType:(NSString *)type;

@end

@interface Dog : Father
@end

@interface Cat : Father
@end

//
//  DecorateObject.h
//  OC
//
//  Created by ZSY on 2018/5/17.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 参考：https://www.jianshu.com/p/b4832dc54a95
 *** 装饰者模式：是面向对象编程领域中，一种动态地往一个类中添加新的行为的设计模式。就功能而言，修饰模式相比生成子类更为灵活，这样可以给某个对象而不是整个类添加一些功能
 说明：装饰者模式使用组合对象的形式
 */

@protocol manProtocol<NSObject>                                            //被装饰者协议，接口形式（也可以定义一个基类并使用继承，不建议使用继承）
@optional
-(NSString *)getManName;
-(NSString *)getManYear;
@end

@protocol womanProtocol<manProtocol>                                    //装饰者协议
//-(NSString *)getAddress;
@end

@interface DecorateObject : NSObject<manProtocol>                          //被装饰者（即初始对象）
-(instancetype)initWithName:(NSString *)name year:(NSString *)year;
@end

@interface firstWoman : NSObject<womanProtocol>                                //装饰者（修饰“被装饰者”的对象）
@property (nonatomic, strong) id<manProtocol> thisMan;
-(instancetype)initWithObject:(id<manProtocol>)object;
@end

@interface secondWoman : NSObject<womanProtocol>                                   //同上
@property (nonatomic, strong) id<manProtocol> thisMan;
-(instancetype)initWithObject:(id<manProtocol>)object;
@end

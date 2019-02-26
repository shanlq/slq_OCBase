//
//  TestObject.h
//  OC
//
//  Created by ZSY on 2018/5/16.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 *** 参考：https://my.oschina.net/daguoshi/blog/504704?p=1
 *** 组合模式：将对象组合成树形结构以表示“部分-整体”的层次结构，它使得用户对单个对象和组合对象的使用具有一致性，用户可以统一地使用组合结构中的所有对象。
 */

@protocol comBinationProtocol                                    //协议基类：定义所有需要执行的方法，用@optoinal表示此协议方法可只执行一部分
@optional                                                              
-(void)addPerson:(id<comBinationProtocol>)person;          //id<comBinationProtocol>表示遵循comBinationProtocol协议的类（无需筛选具体的类，id类型运行时自动判断）
-(void)removePerson:(id<comBinationProtocol>)person;
-(void)gather;
@end

@interface TestObject : NSObject<comBinationProtocol>           //在每个具体的类中定义自己的属性
@property (nonatomic, strong) NSMutableArray *perpons;
@property (nonatomic, strong) NSString *name;
-(instancetype)init;
@end

@interface secondObject : TestObject

@property (nonatomic, strong) NSString *thisName;
@property (nonatomic, assign) int year;

-(instancetype)initWithName:(NSString *)name year:(int)year;

@end

//
//  adaptorModel.h
//  OC
//
//  Created by ZSY on 2018/5/17.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "adaptorProtocol.h"

/*
 *** 参考：http://www.cocoachina.com/ios/20161013/17740.html
 *** 适配器模式：将一类的接口转换成客户希望的另外一个接口（即制定协议存放接口），适配器模式使得原本由于接口不兼容而不能一起工作那些类可以一起工作（统一使用协议）。
 优点：
 解耦合，让视图类不和数据类产生耦合，使视图类更加独立。  新增加数据类的时候不需要修改视图类。
 缺点：
 会新增加很多类，使系统更凌乱，代码可读性更弱了。
 */

@interface adaptorModel : NSObject<adaptorProtocol>       //协议中定义了所有可能用到的方法

-(instancetype)initWithName:(NSString *)name year:(NSString *)year;

@end

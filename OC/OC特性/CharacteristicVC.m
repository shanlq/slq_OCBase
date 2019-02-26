//
//  CharacteristicVC.m
//  OC
//
//  Created by apple on 2017/10/18.
//  Copyright © 2017年 shanlq. All rights reserved.
//

#import "CharacteristicVC.h"
#import "NSStringOne.h"
#import "NSStringSecond.h"
#import <objc/runtime.h>

@interface CharacteristicVC ()

@end

@implementation CharacteristicVC

/*
 面向对象语言特性：封装、继承、多态
 多态：
 定义：用一个父类的指针指向子类的对象，在函数（方法）调用的时候可以调用到正确版本的函数（方法）。
 注意点：1、没有继承就没有多态   2、该父类指针对象只能调用子类中重写父类的方法，即不能调用子类的私有方法。
 使用场景：多用作参数传递、返回值回调等
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //下面用父类指针和用本类指针声明的对象都是指向的alloc生成的子类对象，所以结果是相同的（多态）。
//    NSString *str = @"slqsuccess";
//    NSString *firstSonStr = [[NSStringOne alloc] init];
//    NSString *secondSonStr = [[NSStringSecond alloc] init];
    NSString *str = @"slqsuccess";
    NSStringOne *firstSonStr = [[NSStringOne alloc] init];
    NSStringSecond *secondSonStr = [[NSStringSecond alloc] init];
    NSLog(@"%@", [self TestPrintWithStr:str]);
    NSLog(@"%@", [self TestPrintWithStr:firstSonStr]);
    NSLog(@"%@", [self TestPrintWithStr:secondSonStr]);
    
    [self Test1];
}

//这个方法中参数与返回值都使用到了多态（定义的参数、返回值类型都是父类指针类型NSString，但是依然可以根据传入的对象str（父类对象或子类对象）动态的调用到正确版本的方法）。
-(NSString *)TestPrintWithStr:(NSString *)str
{
    //当父类的指针对象调用子类重写的父类方法时，在编译阶段时到NSString类中查找是否存在该方法，存在则开始运行（即进入运行时runtime机制），这时对象发消息会转变为objc_msgSend(id self, SEL op)方法，此时self就是该对象的实际指针指向即子类对象，所以下一步会到子类中查找该方法op找到则执行，未找到则报错。
    NSLog(@"%@", [str substringFromIndex:2]);
    //当父类的指针对象调用子类的私有方法时，在编译阶段就会报错（即还没有进入运行时runtime阶段），这时会到str对象的类（即声明的指针类型NSString）中查找是否存在该方法，不存在则直接报错并不运行。
//    if([str isKindOfClass:[NSStringOne class]])
//        [str privateFunction];
    return [str substringToIndex:4];
}

//typedef使用注意点
-(void)Test1
{
    typedef char* a;    //typedef和define类似但不同，typedef可替换指针并可使用其进行变量的声明。
    char num[4] = "slq";
    const char *x = num;      //常量指针 则可以改变x的指向即可以改变x指针变量的内容，不可改变x所指向内存的内容即*x
    const a y = num;          //指针常量 则可以改变y指向内存的内容即*y，而不可改变y的内容即y的指向。（优先级 系统类型>自定义类型 即等于a const y = num，const会先修饰作用到y变量）
    x++;                      //x的指向可改变，即这里得到x是num[1]的地址，*x是num[1]
//    y++;                    //y的内容不可改变，即y的指向不可改变
    *y = num[1];              //y所指向内存的内容可改变
    NSLog(@"测试typedef：%c, %c", *x, *y);   //*x与*y值相同
}


@end

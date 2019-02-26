//
//  SingtonManager.h
//  OC
//
//  Created by ZSY on 2018/4/13.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 *** 单例定义：保证一个类只有一个实例，并提供一个访问它的全局访问点
 注意点：
 1、内存：因为单例对象是静态变量会一直存在于内存中，所以涉及到单例对象强引用或单例对象内容较多时都应该注意该单例的内存释放时机（release或置空），以防止其长期占用内存。
 2、循环引用：注意尽量不要在初始化单例对象时（alloc方法中或shareInstance方法中）强引用其他对象，容易造成引用循环。
 */
@interface SingtonManager : NSObject

//宏定义：当不使用sharedInstance创建对象时 给予报错提示（配合DJ_SINGLETON_IMP使用）
DJ_SINGLETON_DEF(SingtonManager);

@end


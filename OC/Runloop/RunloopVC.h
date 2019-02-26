//
//  RunloopVC.h
//  OC
//
//  Created by apple on 2017/11/27.
//  Copyright © 2017年 shanlq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RunloopVC : UIViewController

/*
 什么是RunLoop?
 从字面上看:运行循环、跑圈
 其实它内部就是do-while循环的结构体,在这个循环内部不断的处理各种任务(比如Source、Timer、Observer)
 一个线程对应一个RunLoop,主线程的RunLoop默认已经启动,子线程的RunLoop需要手动启动(调用run方法)
 RunLoop只能选择一个Mode启动,如果当前Mode中没有任何Soure、Timer、Observer,那么就直接退出RunLoop
 
 在开发中如何使用RunLoop?什么应用场景?
 1、开启一个常驻线程(让一个子线程不进入消亡状态,等待其他线程发来消息,处理其他事件)
 2、在子线程中开启一个定时器
 3、在子线程中进行一些长期监控
 
 系统runloop的使用有哪些体现？
 （结合runloop的原理，唤醒->循环->睡眠->退出）
 1、自动释放池：app启动后创建主线程的同时会创建自动释放池，并在池中注册了两个Runloop观察者来监听自动释放池的添加、释放
 2、NSTimer：加在NSTimer上的事件会被默认添加到default模式的NSRunloop中，并由该线程的runloop控制事件的循环（Tolerance表示时间误差值）
 3、performSelecter:afterDelay: ：该方法内部会创建一个NSTimer来计时，同上
 4、事件响应：app启动后主线程上的NSRunloop会监听app中所有的点击、硬件操作等一系列操作动作
 5、手势：同上
 6、GCD

 */

@end

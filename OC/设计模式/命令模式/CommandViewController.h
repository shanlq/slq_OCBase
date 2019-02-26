//
//  CommandViewController.h
//  OC
//
//  Created by ZSY on 2018/4/24.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 *** 命令模式：将一个请求封装为一个对象，从而使你可以用不同的请求对客户进行参数化，支持对请求排序、记录、撤销等操作。
 说明：其实就是将操作过程封装成对象，然后通过参数在对象管理类中创建不同的对象进从而进行不同的操作。commandViewController：命令发出者  commandManager：命令管理者（用来创建并操作“命令对象”）、commandImplement：命令对象（封装了命令对应的具体操作过程）
 */

@interface CommandViewController : UIViewController

@end

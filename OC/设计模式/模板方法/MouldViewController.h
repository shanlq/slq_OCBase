//
//  MouldViewController.h
//  OC
//
//  Created by ZSY on 2018/4/24.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MouldViewController : UIViewController

/*
 *** 定义一个操作中的算法的骨架，而将一些步骤延迟到子类中，TemplateMethod使得子类可以不改变一个算法的结构即可以重定义该算法得某些特定步骤。 
 */

-(UIButton *)creatBtn;

@end

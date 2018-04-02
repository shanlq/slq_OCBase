//
//  ViewController.m
//  OC
//
//  Created by apple on 2017/11/24.
//  Copyright © 2017年 shanlq. All rights reserved.
//

#import "ViewController.h"
#import "SonClass.h"
/*
 结语：a->+(void)Load、b->+(void)initialize、c->-(id)init
 1、执行顺序：a（加载类资源，编译阶段） > main()（运行时入口） > b（运行时阶段，初始化类资源） > c（运行时阶段，初始化具体的变量、对象）
 2、效果：a、b都是类方法，分别加载和初始化类的资源，所以该方法只执行一次（父类、所有子类都会执行一次）；c是实例初始化方法，创建几次实例对象就会执行几次。
 3、细说：a：加载Compile Sources中的文件，按顺序从上到下依次加载，执行单个.m文件时会按照继承顺序从父类到子类依次加载。
         b：初始化子类对象时（alloc、new、class等），A、若还未初始化其父类，则会按照该类的继承关系从父类到子类依次执行b方法，若子类中未实现b方法，则该类的isa指针会追溯到其父类中查询b方法，但此时虽然是执行的父类中的b方法，但是调用的对象实际是该子类即isa指针指向该子类。B、若已经初始化过其父类，则会直接执行该子类中的b方法，若子类中未实现b方法，则同上A
         c：实例对象初始化方法，但同样只初始化父类一次，并且是和b方法一同执行。具体的子类对象初始化几次就执行几次。
 */

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FatherClass *father = [[FatherClass alloc] init];
    _son = [[SonClass alloc] init];
    SonClass *son2 = [[SonClass alloc] init];
    SonClass *son3 = [SonClass new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

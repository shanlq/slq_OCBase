//
//  KVOViewController.m
//  OC
//
//  Created by ZSY on 2018/4/12.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "KVOViewController.h"

@interface KVOViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) double money;

@end

@implementation KVOViewController

/*
 参考：https://www.jianshu.com/p/742b4b248da9
 *** KVO原理：对某个类的某个属性添加监听->KVO机制会创建对应名为“NSKVONotifying_类名”的子类，并在子类中重写该属性的setter方法->当被监听的属性发生变化时调用其子类“NSKVONotifying_类名”中的setter方法并传值->获取该属性观察者并进行通知回调（其实也可以使用block或协议）
 第二步实现：使用runtime即在程序运行时创建子类（使用objc_allocateClassPair()方法)，同时为该子类添加该属性对应的setter方法（使用class_addMethod()）
 最后一步：使用objc_getAssociatedObject方法获取该属性所有的观察者并进行通知
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
    
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    self.money = 0;
    //kvo观察UITableView的contentOffset属性、self的dataArr属性、self的money属性
    [_tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self addObserver:self forKeyPath:@"dataArr" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self addObserver:self forKeyPath:@"money" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(changeArray) userInfo:nil repeats:YES];
}

-(void)dealloc
{
    [self removeObserver:self forKeyPath:@"contentOffset"];          //必须移除KVO监听
    [self removeObserver:self forKeyPath:@"dataArr"];
    [self removeObserver:self forKeyPath:@"money"];
}

#pragma mark NSTimer
-(void)changeArray
{
    //不能直接使用self.dataArr（因为NSArray被添加kvo后，在所创建的“NSKVONotifying_类名”子类中会新建NSKeyValueMutableArray类型的数组并重写setter方法，则这里需要获取该类型的数组并赋值，在kvo回调中才会将NSKeyValueMutableArray中的值赋值给self.dataArr)
    [[self mutableArrayValueForKey:@"dataArr"] addObject:@"xxx"];
    NSLog(@"%@, %@", [self mutableArrayValueForKey:@"dataArr"].superclass, self.dataArr.superclass);
//    [self.dataArr addObject:@"xxx"];
    
    
    self.money ++;
}

#pragma KVO NSNotification
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if([keyPath isEqualToString:@"contentOffset"])
    {
        NSLog(@"列表的偏移量：%f", _tableView.contentOffset.y);
        if(_tableView.contentOffset.y >= 0 && _tableView.contentOffset.y <= 200)
        {
            self.navigationController.navigationBar.alpha = (200 - _tableView.contentOffset.y)/80;
        }
    }
    if([keyPath isEqualToString:@"dataArr"])
    {
        NSLog(@"数组变化：%@\n %@", _dataArr, [self mutableArrayValueForKey:@"dataArr"]);
    }
    if([keyPath isEqualToString:@"money"])
    {
        NSLog(@"金额变化：%.f", self.money);
    }
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
-(UITableViewCell  *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}
#pragma mark getter
-(NSMutableArray *)dataArr
{
    if(!_dataArr)
    {
        _dataArr = [NSMutableArray arrayWithObjects:@"slq", @"shanlq", nil];
    }
    return _dataArr;
}

@end

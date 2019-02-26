//
//  KVCViewController.m
//  OC
//
//  Created by ZSY on 2018/4/12.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "KVCViewController.h"

@implementation SecondModel : NSObject                  //在.h头文件中声明两个类后 必须在.m中实现他们即@implementation
@end

@implementation KVCModel : NSObject
@end

@interface KVCViewController ()

@property (nonatomic, strong) NSMutableArray *thisArr;

@end

@implementation KVCViewController

/*
 *** KVC参考 https://www.jianshu.com/p/45cbd324ea65
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self baseFunction];
    [self MutableArrKVCFunction];
//    [self DictionaryKVCFunction];
//    [self kvcChangeUIFounction];
}

/*
 *** KVC基础用法
 setValue:forKey 原理：大致过程就是 调用该方法->内部首先使用runtime获取model的所有属性->比对传入的键值“key“->使用object_setIvar()方法为该键值（即对象的属性）设置新值value（或直接使用set方法）。其中还需考虑各种error情况
 valueForKey 原理：调用方法->内部首先使用runtime获取model的所有属性->比对传入的键值“key“->使用object_getIvar()方法获取该键值（对象属性）对应的值（或直接使用get方法）
 */
-(void)baseFunction
{
    KVCModel *model = [[KVCModel alloc] init];
    SecondModel *dataModel = [[SecondModel alloc] init];
    //    dataModel.height = @"178";         //直接赋值和下面的使用[setValue:forKeyPath]方法效果相同
    model.dataModel = dataModel;                 //这里必须创建二级对象并赋值给上层对象的属性，否则无法使用keyPath查找
    [model setValue:@"slq" forKey:@"name"];
    NSString *name = [model valueForKey:@"name"];
    [model setValue:@"178.00" forKeyPath:@"dataModel.height"];
    NSString *height = [model valueForKeyPath:@"dataModel.height"];
    [model setValue:nil forKey:@"name"];
    
    NSLog(@"%@身高%@", name, height);
}
//重写setNilValueForKey方法，当setValue:forKey时若value为空 则会回调该方法
-(void)setNilValueForKey:(NSString *)key
{
    NSLog(@"不能对%@设置空的Value", key);
}

/*
 *** KVC与数组、集合
 */
//使用KVO监听可变数组的内容变化[mutableSetValueForKey:]->获取可变集合，[mutableSetValueForKeyPath:]->获取下级可变集合，[mutableArrayValueForKey:]->获取可变数组，[mutableArrayValueForKeyPath:]->获取下级可变数组 相同
-(void)MutableArrKVCFunction
{
    //对_thisArr属性添加监听实际上是将_thisArr复制出来一个指向同一内存的不同指针，并对该指针添加监听而不是直接监听_thisArr。
    _thisArr = [NSMutableArray arrayWithCapacity:0];
    [self addObserver:self forKeyPath:@"thisArr" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    [_thisArr addObject:@"1"];                                                   //直接操作_thisArr不触发监听回调
    NSMutableArray *kvcArr = [self mutableArrayValueForKey:@"thisArr"];
    [kvcArr addObject:@"增加2"];                                                   //操作加了KVO监听的数组时 会被监听到
    [kvcArr addObject:@"增加3"];
    kvcArr[1] = @"tttt";
    [kvcArr removeObjectAtIndex:0];
    //因为_thisArr和kvcArr是指向同一块内存的不同指针，且操作数组即修改内存中的值，所以任何时候_thisArr与kvcArr的值都是相同的，区别就是操作_thisArr不会有kvo监听回调
    NSLog(@"\n 两个数组是否相同（指针）：%d \n 两个数组值是否相同（值）：%d \n _thisArr：%@, kvc数组：%@", _thisArr == kvcArr, [_thisArr isEqualToArray:kvcArr], _thisArr, kvcArr);
    
}
-(void)dealloc
{
    [self removeObserver:self forKeyPath:@"thisArr"];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if([keyPath isEqualToString:@"thisArr"])
    {
        NSLog(@"可变数组发生变化%@", change);
    }
}

/*
 *** KVC与字典，可用于model与字典的解析转化
 */
-(void)DictionaryKVCFunction
{
    KVCModel *model = [[KVCModel alloc] init];
    //通过键值对为对象的属性赋值，若“键”值错误则会crash，因为在model对象中找不到对应的属性
    [model setValuesForKeysWithDictionary:@{@"name": @"slq", @"year": @"24", @"address": @"gz"}];
    //获取model中指定键值的属性值
    NSDictionary *dic = [model dictionaryWithValuesForKeys:@[@"name", @"year"]];
    NSLog(@"model.address = %@, 获取的指定key值的键值对：%@", model.address, dic);

}

/*
 *** 使用KVC修改UI控件属性
 */
-(void)kvcChangeUIFounction
{
    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 200, 40)];
    tf.placeholder = @"请输入内容";
    tf.font = [UIFont systemFontOfSize:16];
    tf.textColor = [UIColor blackColor];
    [self.view addSubview:tf];
    
    [tf setValue:[UIFont systemFontOfSize:26] forKeyPath:@"_placeholderLabel.font"];
    [tf setValue:[UIColor blueColor] forKeyPath:@"_placeholderLabel.textColor"];               //下级属性
    [tf setValue:[UIColor blueColor] forKey:@"textColor"];                                           //同级属性
}


@end

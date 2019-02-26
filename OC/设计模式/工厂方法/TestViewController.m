//
//  TestViewController.m
//  OC
//
//  Created by ZSY on 2018/4/13.
//  Copyright © 2018年 shanlq. All rights reserved.
//

#import "TestViewController.h"
#import "FactoryMethod.h"
#import "AbstractFactory.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self factoryMethod];
    [self abstractFactoryMethod];
}

-(void)factoryMethod
{
    FactoryMethod *animal = [[FactoryMethod alloc] init];
    Father *first = [animal createAnimalWithType:@"cat"];
    Father *second = [animal createAnimalWithType:@"dog"];
    NSLog(@"firsts = %@, second = %@", first.class, second.class);
}

-(void)abstractFactoryMethod
{
    //使用不同的工厂子类创建不同的实例对象
    ManUserInfo *man = [[[AbstractManClass alloc] init] CreatPeople];
    WomanUserInfo *woman = [[[AbstractWomanClass alloc] init] CreatPeople];
    NSLog(@"\nMAN name is %@, age is %d\nWOMAN name is %@, year is %d", man.name, man.age, woman.name, woman.year);
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

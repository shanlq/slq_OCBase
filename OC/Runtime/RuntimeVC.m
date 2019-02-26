//
//  RuntimeVC.m
//  OC
//
//  Created by apple on 2017/11/25.
//  Copyright © 2017年 shanlq. All rights reserved.
//

#import "RuntimeVC.h"
#import <objc/runtime.h>
#import "NSArray+empty.h"

@interface RuntimeVC ()

@end

@implementation RuntimeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    Model *model = [[Model alloc] init];
//    [self RuntimeSelecterTest];
//    [self RuntimePropertyWithModelName:@"Model"];
    [self RuntimeBlackMagic];
}

-(void)Test1
{
    NSLog(@"测试Test1方法");
}

//runtime中selecter的应用
-(void)RuntimeSelecterTest
{
    NSLog(@"测试Runtime Selecter功能：\n");
    [self performSelector:@selector(Test1)];        //和[self Test1]效果相同，即执行Test1()方法
    
    SEL action = NSSelectorFromString(@"TestWithDic:WithStr:");        //action中有两个参数，需使用NSInvocation
    Class Target = NSClassFromString(@"NSStringOne");
    NSObject *target = [[Target alloc] init];
    NSDictionary *dic = @{@"num": @"1", @"second":@"2", @"third":@"3"};
    NSString *str = @"slq";
    
    //1、NSInvocation可处理任意类型的action（包括参数>2、有返回值）
    NSMethodSignature *signature = [target methodSignatureForSelector:action];        //获取action签名
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setArgument:&dic atIndex:2];           //设置参数，必须从2开始，因为0->target、1->action
    [invocation setArgument:&str atIndex:3];           //参数下标依次往后排
    [invocation setTarget:target];
    [invocation setSelector:action];
    [invocation invoke];                               //开始调用
    
    const char* returnType = [signature methodReturnType];        //常量指针，获取返回值的类型
    id returnValue;
    if(!strcmp(returnType, @encode(void)))                        //若返回值为void，即没有返回值
    {
        returnValue = nil;
    }
    else if(!strcmp(returnType, @encode(id)))                    //若返回值为id类型，则直接将返回值写入returnValue变量中
    {
        [invocation getReturnValue:&returnValue];
        NSLog(@"返回值：%@", returnValue);
    }
    else                                                        //若为基础数据类型，则需判断具体是什么类型
    {
        long length = [signature methodReturnLength];       //获取返回值类型的长度
        void *buffer = (void *)malloc(length);              //创建对应长度的内存
        [invocation getReturnValue:buffer];                 //将返回值写入内存
        
        if( !strcmp(returnType, @encode(BOOL)) ) {
            returnValue = [NSNumber numberWithBool:*((BOOL*)buffer)];      //取出内存buffer中的返回值
            NSLog(@"返回值BOOL类型：%d", [returnValue boolValue]);
        }
        else if( !strcmp(returnType, @encode(NSInteger)) ){
            returnValue = [NSNumber numberWithInteger:*((NSInteger*)buffer)];
            NSLog(@"返回值NSInteger类型：%d", [returnValue intValue]);
        }
        returnValue = [NSValue valueWithBytes:buffer objCType:returnType];
    }
    
    //2、直接调用target中的action方法(适用于参数<2且无返回值的action，由于只能传一个参数object，所以当action有两个参数时，使用这个方法会对两个参数都赋值为str)
    [target performSelector:action withObject:str];
}

-(void)RuntimePropertyWithModelName:(NSString *)modelName
{
    unsigned int pNum;
    unsigned int mNum;
    //获取属性列表
    objc_property_t *properties = class_copyPropertyList(NSClassFromString(modelName), &pNum);
    //获取的方法列表（包括自定义方法和由@property自动生成的setter、getter方法）
    objc_property_t *methodList = class_copyMethodList(NSClassFromString(modelName), &mNum);
    for(int i = 0; i < pNum; i++)
    {
        NSLog(@"属性:\n");
        objc_property_t property = properties[i];
        NSLog(@"char类型%s, %s", property_getName(property), property_getAttributes(property));
        NSString *propertyStr = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        NSLog(@"NSString类型：%@ \n", propertyStr);
    }
    for(int i = 0; i < mNum; i++)
    {
        NSLog(@"方法：\n");
        objc_property_t method = methodList[i];
        unsigned int argumentNum = method_getNumberOfArguments(method);
        NSLog(@"方法:名称：%s，返回值类型：%s，编码类型:%s",method_getName(method), method_copyReturnType(method), method_getTypeEncoding(method));
        
        SEL action = method_getName(method);
        NSLog(@"转译后的方法名：%@", NSStringFromSelector(action));
        
        Class model = NSClassFromString(modelName);
        NSObject *target = [[model alloc] init];
        NSMethodSignature *signature = [target methodSignatureForSelector:action];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        id returnValue;
        id argumentVlaue;
        for(int j = 0; j < argumentNum; j++)         //对于参数只需知道其类型即可（用来传值）
        {
            const char *argumentType = [signature getArgumentTypeAtIndex:j];
            if(!strcmp(argumentType, @encode(id)))      //可能需要在这里逐个判断参数的数据类型
            {
                [invocation getArgument:&argumentVlaue atIndex:j];
                NSLog(@"参数:%@, 参数类型：%s", argumentVlaue, argumentType);
            }
            else if(!strcmp(argumentType, @encode(int)))
            {
//                void *buffer = malloc(sizeof(int));
//                [invocation getArgument:&buffer atIndex:j];
//                argumentVlaue = [NSNumber numberWithInt:*((int*)buffer)];
                int x;
                [invocation getArgument:&x atIndex:j];
                NSLog(@"int型参数：%d, 类型：%s", x, argumentType);
            }
        }
        const char *returnType = [signature methodReturnType];
        if(!strcmp(returnType, @encode(void)))
        {
            NSLog(@"返回值为空");
        }
        else if(!strcmp(returnType, @encode(id)))
        {
            [invocation getReturnValue:&returnValue];       //这里应该能获取到返回值的？？？？但是好像没有成功。
            NSLog(@"返回值：%@, 类型：%s", returnValue, returnType);
        }
        else
        {
            NSInteger length = [signature methodReturnLength];
            void *buffer = malloc(length);
            [invocation getReturnValue:&buffer];
            if(!strcmp(returnType, @encode(BOOL)))
            {
                returnValue = [NSNumber numberWithBool:*((BOOL*)buffer)];
                NSLog(@"返回值是BOOL类型：%@", returnValue);
            }
        }
    }
}
//runtime黑魔法（Method Swizzling）：通过method_exchangeImplementations()方法，用自定义方法替换系统方法，以做相关默认处理
//参考：http://www.cocoachina.com/ios/20160121/15076.html
-(void)RuntimeBlackMagic
{
    //1、数组越界
    NSArray *arr = @[@"shanlq", @"yanliu"];
    //这里调用的arr[2]即[arr objectAtIndex:2],会执行到customObjectAtIndex:方法
    NSLog(@"输出数组数据：%@", arr[2]);
}


@end

//
//  NSOperationVC.m
//  OC
//
//  Created by apple on 2017/11/30.
//  Copyright © 2017年 shanlq. All rights reserved.
//

#import "NSOperationVC.h"
#import "SonOperation.h"

#import <ARKit/ARKit.h>

@interface NSOperationVC ()

@end

@implementation NSOperationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self NSOperationTest1];
//    [self NSOperationTest2];
    [self NSOperationTest3];
    
    
}

//1、NSInvocationOperation、NSBlockOperation、NSOperation自定义子类创建的任务若不添加到NSOperationQueue中则都是在主线程上执行，不会开辟新线程。
-(void)NSOperationTest1
{
    NSInvocationOperation *IOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(ThreadEvent) object:nil];
    [IOperation start];
    
    NSBlockOperation *bOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"NSBlockOperation类任务:%@", [NSThread currentThread]);
    }];
    [bOperation start];
    
    SonOperation *sonOperation = [[SonOperation alloc] init];
    [sonOperation start];
}
-(void)ThreadEvent
{
    NSLog(@"NSInvocationOperation类任务：%@", [NSThread currentThread]);
}

//2、将创建的operation添加到NSOperationQueue（相当于GCD中的队列）中将会创建新线程，一个operation任务只能添加到一个队列中，不能重复添加
-(void)NSOperationTest2
{
    //a、主队列（添加到主队列上的任务都在主线程上执行）
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    //最大并行数，默认-1表示没有限制即并行，为1时表示串行，>1时表示并行（但是设置的值过大时，会按照系统允许的最大并行数执行）
    mainQueue.maxConcurrentOperationCount = 1;
    [mainQueue addOperationWithBlock:^{
        NSLog(@"主队列：以Block形式添加任务：%@", [NSThread currentThread]);
    }];
    NSBlockOperation *mainOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"主队列：以operation形式添加：%@", [NSThread currentThread]);
    }];
    [mainQueue addOperation:mainOperation];
    
    //b、自定义队列（会开辟新线程）
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperationWithBlock:^{
        NSLog(@"非主队列：以Block形式添加任务：%@", [NSThread currentThread]);
    }];
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"非主队列：以operation形式添加：%@", [NSThread currentThread]);
    }];
    [queue addOperation:operation];
}

//3、其他功能
-(void)NSOperationTest3
{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = 1;                                         //设置为串行
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"block任务一%@", [NSThread currentThread]);
    }];
    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"block任务二%@", [NSThread currentThread]);
    }];
    NSBlockOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"block任务三%@", [NSThread currentThread]);
    }];
    NSBlockOperation *operation4 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"block任务四%@", [NSThread currentThread]);
    }];
    //a、添加依赖：当任务并行时队列中的任务几乎同时执行（除依赖任务），添加依赖的任务最后执行；当任务串行时队列中的任务按照添加顺序依次执行，但是对于添加依赖的两个任务来说，被依赖的任务先执行，随后添加依赖的任务立即执行。
    [operation addDependency:operation3];
    [queue addOperation:operation];
    [queue addOperation:operation2];
    [queue addOperation:operation3];
    [queue addOperation:operation4];
    
//    b、取消线程的执行（若线程任务处于“正在执行”的状态，则该方法无效即不能取消；若任务处于“等待执行“的状态，则执行该方法后任务将从队列中移除）
    //当被依赖的任务被移除后，两个任务间的依赖关系应该是被取消了，并没有影响到依赖任务的执行。
    if(!operation3.executing && !operation3.finished)    //任务还未执行时
    {
        [operation3 cancel];
        NSLog(@"该线程是否已取消：%d", operation3.cancelled);
    }
    
    //c、（队列）暂停任务
    if(!queue.isSuspended)
    {
        [queue setSuspended:YES];
        [self performSelector:@selector(StartQueue:) withObject:queue afterDelay:2];
    }
}

-(void)StartQueue:(NSOperationQueue *)queue
{
    [queue setSuspended:NO];
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

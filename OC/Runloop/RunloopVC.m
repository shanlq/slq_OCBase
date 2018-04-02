//
//  RunloopVC.m
//  OC
//
//  Created by apple on 2017/11/27.
//  Copyright © 2017年 shanlq. All rights reserved.
//

/*
 参考:http://blog.csdn.net/u011619283/article/details/53433243
     http://www.cocoachina.com/ios/20150601/11970.html
 */

#import "RunloopVC.h"
#import "MyThread.h"

@interface RunloopVC ()<UIScrollViewDelegate>

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSTimer *timer4;

@property (nonatomic, strong) MyThread *thread;

@end

@implementation RunloopVC
static int num = 5;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self RunloopTest1];
//    [self RunloopTest2];
//    [self RunloopTest3];
    [self RunloopTest4];
    
}

//1、对runloop添加监听
-(void)RunloopTest1
{
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/2 - 50, 80, 100, 60)];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = [UIFont systemFontOfSize:25];
    lab.tag = 1;
    lab.text = [NSString stringWithFormat:@"%d", num];
    [self.view addSubview:lab];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(TimeChange) userInfo:nil repeats:YES];
    //获得当前thread的Runloop（runloop在获取时创建）
    NSRunLoop* myRunLoop = [NSRunLoop currentRunLoop];
    
    //设置Run loop observer的运行环境 
    CFRunLoopObserverContext context = {0,(__bridge void *)(self),NULL,NULL,NULL};
    CFRunLoopObserverRef observer = CFRunLoopObserverCreate(kCFAllocatorDefault,kCFRunLoopAllActivities, YES, 0, &callBack, &context);
    if(observer)
    {
        CFRunLoopRef cfRunloop = [myRunLoop getCFRunLoop];
        CFRunLoopAddObserver(cfRunloop, observer, kCFRunLoopDefaultMode);
    }
    
    [myRunLoop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]];    //runloop运行直到3秒后
}

void callBack(CFRunLoopObserverRef observer,CFRunLoopActivity activity,void *info)
{
    switch (activity) {
        case kCFRunLoopEntry:
            NSLog(@"run loop entry");
            break;
        case kCFRunLoopBeforeTimers:
            NSLog(@"run loop before timers");
            break;
        case kCFRunLoopBeforeSources:
            NSLog(@"run loop before sources");
            break;
        case kCFRunLoopBeforeWaiting:
            NSLog(@"run loop before waiting");
            break;
        case kCFRunLoopAfterWaiting:
            NSLog(@"run loop after waiting");
            break;
        case kCFRunLoopExit:
            NSLog(@"run loop exit");
            break;
        default:
            break;
    }
}

-(void)TimeChange
{
    num--;
    UILabel *lab = [self.view viewWithTag:1];
    lab.text = [NSString stringWithFormat:@"%d", num];
    if(num == 0)
    {
        [_timer invalidate];
    }
}

//2、使用runloop延长线程的生命周期（如不使用runloop则线程中的任务完成后就会被释放）
//a、未使用runloop，线程释放。
-(void)RunloopTest2
{
    MyThread *thread = [[MyThread alloc] initWithTarget:self selector:@selector(ThreadTask) object:nil];
    [thread start];
}
//执行完任务后就会执行线程类MyThread的dealloc将线程销毁
-(void)ThreadTask
{
    NSLog(@"开始线程任务:%@", [NSThread currentThread]);
    sleep(3);
    NSLog(@"结束线程任务:%@", [NSThread currentThread]);
}

//b、使用runloop延长线程的生命周期
-(void)RunloopTest3
{
    //创建线程的同时，获取并设置runloop（创建线程时并没有对应的runloop，在线程中通过currentRunLoop获取runloop时才会创建runloop且默认模式是kCFRunLoopDefaultMode，但是runloop的mode中没有任何的item，所以runloop出于休眠状态，这才导致RunloopTest2例子中的线程不能长时间存在（执行完任务后就被销毁）。但是在这个例子中，我们获取并在mode中设置了item即唤醒了runloop，所以这个线程才能一直处于运行状态）
    _thread = [[MyThread alloc] initWithTarget:self selector:@selector(AddRunloop) object:nil];
    [_thread setName:@"taskThread"];
    [_thread start];
}

-(void)AddRunloop
{
    //获取（即系统创建）runloop并添加item
    @autoreleasepool
    {
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        [runloop addPort:[NSMachPort port] forMode:NSRunLoopCommonModes];     //添加item到公共mode中，若runloop中没有item则runloop会进入睡眠状态
        NSLog(@"启动RunLoop前--%@", runloop.currentMode);
        [runloop run];
    }
}
//在线程上添加任务
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self performSelector:@selector(ThreadTask2) onThread:_thread withObject:nil waitUntilDone:NO];
}

-(void)ThreadTask2
{
    NSLog(@"启动RunLoop后--%@", [NSRunLoop currentRunLoop]);
    NSLog(@"线程任务开始：%@", _thread);
    sleep(3);
    NSLog(@"线程任务结束：%@", _thread);
}

//3、防止主线程运行NSTUITrackingRunLoopMode时暂停NSDefaultRunLoopMode模式下的任务
-(void)RunloopTest4
{
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    scrollview.delegate = self;
    scrollview.contentSize = CGSizeMake(WIDTH, 1.5*HEIGHT);
    [self.view addSubview:scrollview];
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/2 - 50, 80, 100, 60)];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = [UIFont systemFontOfSize:25];
    lab.tag = 2;
    lab.text = [NSString stringWithFormat:@"%d", num];
    [scrollview addSubview:lab];
    
    //a、_timer4默认添加到主线程，则滑动时（UITrackingRunLoopMode）会暂停_timer4计时器（kCFRunLoopDefaultMode）
    _timer4 = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(TimeChange2) userInfo:nil repeats:YES];
    
//    //b、首先创建一个子线程同时在响应方法中获取runloop，然后将计时器对象_timer4加入到该子线程中。这样就可避免scrollview滑动时影响到该计时器的计时（不同线程间的runloop不会相互影响）。
//    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(SetRunloop) object:nil];
//    [thread start];
//    [self performSelector:@selector(CreateNSTimer) onThread:thread withObject:nil waitUntilDone:NO];
}

//-(void)SetRunloop
//{
//    @autoreleasepool
//    {
//        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
//        [runloop addPort:[NSMachPort port] forMode:NSRunLoopCommonModes];
//        [runloop run];
//    }
//}
//
//-(void)CreateNSTimer
//{
//    _timer4 = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(TimeChange2) userInfo:nil repeats:YES];
//}

-(void)TimeChange2
{
    num--;
    UILabel *lab = [self.view viewWithTag:2];
    lab.text = [NSString stringWithFormat:@"%d", num];
    if(num == 0)
        [_timer4 invalidate];
    
    //若该计时器添加到了子线程则这里获取的就是子线程的runloop
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    NSLog(@"未滑动时runloop模式：%@", runloop.currentMode);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    NSLog(@"滑动的runloop模式：%@", runloop.currentMode);
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

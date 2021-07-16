//
//  ViewController.m
//  三种计时器
//
//  Created by zy on 2021/7/16.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNSTimer];
    [self createCADisplayLink];
}

-(void)create_dispatch_source_t
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    sourceTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    NSTimeInterval delayTime = 1.0f;
    NSTimeInterval timeInterVal = 1.0f;
    dispatch_time_t startDelayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime));
    dispatch_source_set_timer(sourceTimer, startDelayTime, timeInterVal*NSEC_PER_SEC, 0.1*NSEC_PER_SEC);
    dispatch_source_set_event_handler(sourceTimer, ^{
        NSLog(@"");
    });
    dispatch_resume(sourceTimer);
    
}

-(void)updateLink:(CADisplayLink*)theLink
{
    NSLog(@"%ld",theLink.preferredFramesPerSecond);
}

-(void)createCADisplayLink
{
    link = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateLink:)];
    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

-(void)updateNSTimer:(NSTimer*)timer
{
    NSLog(@"%lf",timer.timeInterval);
}

-(void)createNSTimer
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateNSTimer:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    [timer fire];
}


@end

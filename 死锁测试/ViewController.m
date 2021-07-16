//
//  ViewController.m
//  死锁测试
//
//  Created by zy on 2021/7/15.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    que1 = dispatch_queue_create("wbf1", DISPATCH_QUEUE_SERIAL);
    lock1 = [NSLock new];
    
    que2 = dispatch_queue_create("wbf2", 0);
    lock2 = [NSLock new];
    // Do any additional setup after loading the view.
}

- (IBAction)action1:(id)sender {
    dispatch_queue_t aQueue = dispatch_queue_create("wbf", DISPATCH_QUEUE_SERIAL);
    NSLog(@"1");
    dispatch_sync(aQueue, ^{
        NSLog(@"2");
        dispatch_sync(aQueue, ^{
            NSLog(@"4");
        });
        NSLog(@"3");
    });
    NSLog(@"5");
}

- (IBAction)action2:(id)sender {
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    NSLog(@"dispatch_semaphore_t created");
    dispatch_async(que2, ^{
        dispatch_semaphore_signal(semaphore);
        NSLog(@"semaphore plus 1");
    });
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"semaphore minus 1");
    
    
    dispatch_async(que1, ^{
        NSLog(@"1===%@",[NSThread currentThread]);
    });
    
    dispatch_barrier_async(que1, ^{
        NSLog(@"2===%@",[NSThread currentThread]);
    });
    
    dispatch_async(que1, ^{
        NSLog(@"3===%@",[NSThread currentThread]);
    });
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end

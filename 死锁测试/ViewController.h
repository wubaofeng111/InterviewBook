//
//  ViewController.h
//  死锁测试
//
//  Created by zy on 2021/7/15.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
{
    dispatch_queue_t que1;
    NSLock           *lock1;
    
    dispatch_queue_t que2;
    NSLock           *lock2;
    
    
    int res;
}

@end


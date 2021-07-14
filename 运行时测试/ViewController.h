//
//  ViewController.h
//  运行时测试
//
//  Created by zy on 2021/7/13.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
{
    dispatch_queue_t dis;
    NSNotificationQueue *queue;
    
    NSMachPort *port;
}

@end


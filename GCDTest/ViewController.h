//
//  ViewController.h
//  GCDTest
//
//  Created by zy on 2021/7/12.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
{
    dispatch_queue_t que;
    
    dispatch_queue_t mainque;
    dispatch_queue_t globalque;
    dispatch_queue_t customque;
}

@end


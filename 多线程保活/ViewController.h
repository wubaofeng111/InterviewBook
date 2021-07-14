//
//  ViewController.h
//  多线程保活
//
//  Created by zy on 2021/7/13.
//

#import <Cocoa/Cocoa.h>
#import "BFThread.h"

@interface ViewController : NSViewController
{
    NSThread *mhThread;
    BFThread *thread;
}

@property(nonatomic,strong)NSString *name;

@end


//
//  ViewController.h
//  三种计时器
//
//  Created by zy on 2021/7/16.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSTimer *timer;
    CADisplayLink *link;
    dispatch_source_t sourceTimer;
}

@end


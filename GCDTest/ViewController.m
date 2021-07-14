//
//  ViewController.m
//  GCDTest
//
//  Created by zy on 2021/7/12.
//

#import "ViewController.h"
#import "ViewController+BBQ.h"

@implementation ViewController


- (IBAction)pause:(id)sender
{
    dispatch_suspend(que);
    NSLog(@"%@",abc);
    
}
- (IBAction)start:(id)sender
{
    dispatch_resume(que);

    
}
- (IBAction)log:(id)sender {
    dispatch_async(que, ^{
        NSLog(@" test msg -- %@",[NSThread currentThread]);
    });
}
- (IBAction)segment:(NSSegmentedControl*)sender
{
    NSLog(@"%d",sender.intValue);
    switch (sender.intValue) {
        case 0:
        {
            que = customque;
        }
            break;
        case 1:
        {
            que = globalque;
        }
            break;
        case 2:
        {
            que = mainque;
        }
            break;
            
        default:
            break;
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    customque = dispatch_queue_create("wbf_test", NULL);
    
    globalque = dispatch_get_global_queue(0, 0);
    mainque = dispatch_get_main_queue();
    que = customque;
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end

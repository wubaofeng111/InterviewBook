//
//  main.m
//  面试测试
//
//  Created by zy on 2021/7/12.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

int main(int argc, const char * argv[]) {
    
    dispatch_queue_t que = dispatch_queue_create("wbf_test", NULL);
    __block int abc = 0;
    dispatch_async(que, ^{
        while (1) {
            NSLog(@"-------");
            abc++;
            if (abc > 100) {
                dispatch_suspend(que);
            }
            
        }
    });
    
    [[NSApplication sharedApplication] run];
    
//    while (1) {
//        sleep(1);
//    }
//    @autoreleasepool {
//        // insert code here...
//        NSLog(@"Hello, World!");
//    }
    return 0;
}

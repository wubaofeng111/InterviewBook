//
//  main.m
//  NSOpreatequeue测试
//
//  Created by zy on 2021/7/16.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSOperationQueue *queue = [[NSOperationQueue alloc]init];
        NSLog(@"%d",queue.maxConcurrentOperationCount);
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}

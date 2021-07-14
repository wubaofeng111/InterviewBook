//
//  main.m
//  LoadPerson
//
//  Created by zy on 2021/7/14.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface NSObject()
{
@public
    int a;
}
-(void)test;
@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *person = [Person new];
        
        SEL selector = @selector(abc:cd1:andInt:);
        NSMethodSignature *sig = [person methodSignatureForSelector:selector];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];

        // 设置参数
        invocation.target = person;
        invocation.selector = selector;

        NSString *log = @"我是log";
        NSString *log2 = @"我是log2";
        int value3 = 34;
        [invocation setArgument:&log atIndex:2];
        [invocation setArgument:&log2 atIndex:3];
        [invocation setArgument:&value3 atIndex:4];

        // 设置返回值
        NSString *result = nil;
        [invocation retainArguments];
        [invocation invoke];
        [invocation getReturnValue:&result];
        NSLog(@"%@",result);
        
//        NSObject *obj = [NSObject new];
//        [obj test];
//        // insert code here...
//        NSLog(@"Hello, World!");
//        [[Person new]test];
    }
    return 0;
}

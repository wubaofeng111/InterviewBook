//
//  main.m
//  弱引用测试
//
//  Created by zy on 2021/7/14.
//
/*
clang -rewrite-objc -fobjc-arc -stdlib=libc++ main.m
*/

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    id __strong object =[[NSObject alloc] init];
    NSLog(@"%@",object);
    return 0;
}

//
//  BFNextResponder.m
//  响应链
//
//  Created by zy on 2021/7/16.
//

#import "BFNextResponder.h"
#import <objc/runtime.h>



@implementation UIResponder(BFNextResponder)
+(void)load
{
    Method method = class_getInstanceMethod([self class], @selector(nextResponder));
    Method customResponster = class_getInstanceMethod([self class], @selector(bf_nextResponder));
    
    method_exchangeImplementations(method, customResponster);
    int outCount = 0;
    Ivar *ivarS = class_copyIvarList([self class], &outCount);
    for (int i = 0; i < outCount; i++) {
        Ivar ivar = ivarS[i];
        NSLog(@"%s",ivar_getName(ivar));
    }
    
}



-(UIResponder*)bf_nextResponder
{
    id _responderFlags = [self valueForKey:@"_responderFlags"];
    UIResponder *respon = [self bf_nextResponder];
    return respon;
}

@end

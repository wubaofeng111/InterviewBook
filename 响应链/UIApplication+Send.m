//
//  UIApplication+Send.m
//  响应链
//
//  Created by zy on 2021/7/16.
//

#import "UIApplication+Send.h"
#import <objc/runtime.h>

@implementation UIApplication (Send)
+(void)load
{
    Method method = class_getInstanceMethod([self class], @selector(sendEvent:));
    Method customResponster = class_getInstanceMethod([self class], @selector(bf_sendEvent:));
    
    method_exchangeImplementations(method, customResponster);
 
    
}

-(void)bf_sendEvent:(UIEvent *)event
{
    NSLog(@"sendEvent");
    [self bf_sendEvent:event];
    
}



@end

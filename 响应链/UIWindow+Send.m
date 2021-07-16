//
//  UIWindow+Send.m
//  响应链
//
//  Created by zy on 2021/7/16.
//

#import "UIWindow+Send.h"

@implementation UIWindow (Send)
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [[self nextResponder] touchesBegan:touches withEvent:event];
}
@end

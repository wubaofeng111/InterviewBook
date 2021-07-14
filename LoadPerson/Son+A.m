//
//  Son+A.m
//  LoadPerson
//
//  Created by zy on 2021/7/14.
//

#import "Son+A.h"
#import <objc/runtime.h>


@implementation Son (A)
+(void)load
{
    NSLog(@"Son A");
}

-(void)setName:(NSString *)name
{
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end

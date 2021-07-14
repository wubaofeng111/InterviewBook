//
//  Person+C.m
//  LoadPerson
//
//  Created by zy on 2021/7/14.
//

#import "Person+C.h"

@implementation Person (C)
+(void)load
{
    NSLog(@"Person C");
}

-(void)test
{
    NSLog(@"test c");
}
@end

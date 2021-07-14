//
//  Person.m
//  LoadPerson
//
//  Created by zy on 2021/7/14.
//

#import "Person.h"

@implementation Person
+(void)load
{
    NSLog(@"Person");
}

-(NSString*)abc:(NSString *)abc1 cd1:(NSString *)ced andInt:(int)a
{
    printf("%d\n",a);
    return @"baf";
}

-(void)test
{
    NSLog(@"test");
}
@end

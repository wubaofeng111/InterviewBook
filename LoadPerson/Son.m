//
//  Son.m
//  LoadPerson
//
//  Created by zy on 2021/7/14.
//

#import "Son.h"

@implementation Son
+(void)load
{
    NSLog(@"Son");
}

static Son * mSon = nil;

+(Son*)ShareSon
{
    static dispatch_once_t onceToken;
    NSLog(@"%u",onceToken);
    dispatch_once(&onceToken, ^{
        mSon = [Son new];
    });
    
    return mSon;
}

@end

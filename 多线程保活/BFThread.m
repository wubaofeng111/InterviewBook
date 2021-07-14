//
//  BFThread.m
//  多线程保活
//
//  Created by zy on 2021/7/13.
//

#import "BFThread.h"

@implementation BFThread

-(id)initWithTarget:(id)target selector:(SEL)selector object:(id)argument
{
    if (self = [super initWithTarget:self selector:@selector(threadRun:) object:nil]) {
    
    }
    return self;
}

-(void)start
{
    [super start];
    isStoped = NO;
}

-(void)stop
{
    isStoped = YES;
}

-(void)threadRun:(BFThread*)thread
{
    [[NSRunLoop currentRunLoop] addPort:[NSPort new] forMode:NSDefaultRunLoopMode];
    while(!isStoped)
    {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        NSLog(@"------");
    }
}

-(void)runSelector:(SEL)sel WithTarget:(NSObject*)target
{
    if ([target respondsToSelector:sel])
    {
        [target performSelector:sel onThread:self withObject:nil waitUntilDone:NO];
    }
}

-(void)dealloc
{
    NSLog(@"BFThread dealloc");
}
@end

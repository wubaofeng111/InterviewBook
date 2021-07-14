//
//  BFThread.h
//  多线程保活
//
//  Created by zy on 2021/7/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BFThread : NSThread
{
    BOOL isStoped;
}
-(void)stop;
-(void)runSelector:(SEL)sel WithTarget:(id)target;
@end

NS_ASSUME_NONNULL_END

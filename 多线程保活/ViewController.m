//
//  ViewController.m
//  多线程保活
//
//  Created by zy on 2021/7/13.
//

#import "ViewController.h"


@implementation ViewController

//+(BOOL)automaticallyNotifiesObserversForKey:(NSString *)key
//{
//    return NO;
//}
//
//-(void)setName:(NSString *)name
//{
//    [self willChangeValueForKey:@"name"];
//    _name = name;
//    [self didChangeValueForKey:@"name"];
//}

//- (void)willChangeValueForKey:(NSString *)key
//{
//    NSLog(@"%@",key);
//}
//- (void)didChangeValueForKey:(NSString *)key
//{
//    NSLog(@"%@",key);
//}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"%@",change);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];
    
    thread = [[BFThread alloc]initWithTarget:self selector:nil object:nil];
    [thread start];

}

- (IBAction)stop:(id)sender {
    [thread stop];
}

- (IBAction)loop:(id)sender
{
    NSLog(@"action:%@",[NSThread currentThread]);
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"gcd action:%@",[NSThread currentThread]);
    });
//    [thread runSelector:@selector(doSomething) WithTarget:self];
}

static int abc = 10;

-(void)doSomething
{
//    self.name = [NSString stringWithFormat:@"%ld",abc++];
    [self setValue:@"wbaf" forKey:@"name"];
    NSLog(@"name log %@",[NSThread currentThread]);
    
    NSMutableArray *array = [NSMutableArray new];
    
   void (^bbl)() = ^{
       [array addObject:@"134"];
       NSLog(@"%@",array);
    };
    bbl();
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end

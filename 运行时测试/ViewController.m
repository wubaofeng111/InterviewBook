//
//  ViewController.m
//  运行时测试
//
//  Created by zy on 2021/7/13.
//

#import "ViewController.h"
#import <objc/runtime.h>








@interface BFObject : NSObject
{
    int bf_name;
}
@property(nonatomic,strong)NSString *bf_testProperty;
@end

@implementation BFObject

@end

@interface ViewController()<NSMachPortDelegate>

@end

@implementation ViewController

-(void)handleMachMessage:(void *)msg
{
    
}

-(void)handlePortMessage:(NSPortMessage *)message
{
    
}

-(void)handleNotification:(NSNotification*)not objec:(id)o
{
    NSLog(@"11");
}

- (IBAction)push:(id)sender
{
   
    // 接收通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TestNotification" object:nil];
    
//    dispatch_async(dis, ^{
//        NSNotification *noti = [NSNotification notificationWithName:@"wbf" object:nil];
//        [queue enqueueNotification:noti postingStyle:(NSPostNow)];
//    });
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    dis = dispatch_queue_create("wbf_queue", 0);
    int iVarListCount = 0;
    
    Ivar*ivars = class_copyIvarList([BFObject class], &iVarListCount);
    
    for (int i = 0; i < iVarListCount ; i++) {
        NSLog(@"ivarName:%s",ivar_getName(ivars[i]));
    }
    
    NSLog(@"<--------------------------->");
    int iVarsPropertyCount = 0;
    
    objc_property_t *objc_property_tN = class_copyPropertyList([BFObject class], &iVarsPropertyCount);
    for(int i = 0; i < iVarsPropertyCount;i++)
    {
        NSLog(@"propertyName:%s", property_getName(objc_property_tN[i]));
    }
    
    /// 通知测试
    
    // 发送通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:@"TestNotification" object:@1];
    
    port = [NSMachPort new];
    port.delegate = self;
    [[NSRunLoop currentRunLoop] addPort:port forMode:NSRunLoopCommonModes];
    
    queue = [[NSNotificationQueue alloc]init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(not:) name:@"wbf" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserverForName:@"wbf" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
//
//    }];
    
    
    // Do any additional setup after loading the view.
}


-(void)not:(NSNotification*)no
{
    if([[NSThread currentThread]isMainThread])
    {
        NSLog(@"main Thread ");
    }else{
        [port sendBeforeDate:[NSDate date] components:nil from:nil reserved:0];
    }
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end

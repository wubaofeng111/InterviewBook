//
//  ViewController.m
//  响应链
//
//  Created by zy on 2021/7/16.
//

#import "ViewController.h"
#import "BFView.h"

@interface ViewController ()
{
    BFView *bfView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    bfView = [[BFView alloc]initWithFrame:CGRectMake(0, 0, 400, 400)];
    bfView.name = @"superView";
    bfView.backgroundColor = [UIColor redColor];
    [self.view addSubview:bfView];
    
    BFView *view = [[BFView alloc]init];
    view.frame = CGRectMake(0, 0, 100, 100);
    view.backgroundColor = [UIColor yellowColor];
    view.name = @"subView";
    [bfView addSubview:view];
    
    
    
    // Do any additional setup after loading the view.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [[self nextResponder] touchesBegan:touches withEvent:event];
}


@end

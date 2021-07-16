//
//  ViewController.m
//  界面布局测试
//
//  Created by zy on 2021/7/16.
//

#import "ViewController.h"
#import "AView.h"

@interface ViewController ()
{
    AView *view;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    view = [[AView alloc]init];
    view.frame = CGRectMake(0, 0, 300, 300);
    [self.view addSubview:view];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
//    [view setNeedsLayout];
    view.frame = CGRectMake(0, 0, 200, 200);
    
}


@end

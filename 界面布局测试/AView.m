//
//  AView.m
//  界面布局测试
//
//  Created by zy on 2021/7/16.
//

#import "AView.h"

@implementation AView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)layoutSubviews
{
    [super layoutSubviews];
    NSLog(@"layoutSubviews");
}

@end

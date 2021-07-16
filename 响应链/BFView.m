//
//  BFView.m
//  响应链
//
//  Created by zy on 2021/7/16.
//

#import "BFView.h"

@implementation BFView

-(UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.hidden || !self.userInteractionEnabled || self.alpha < 0.01 || ![self pointInside:point withEvent:event])
    {
        return nil;
    }
    else
    {
        for (UIView *subView in [self.subviews reverseObjectEnumerator])
        {
            UIView *hitView = [subView hitTest:[subView convertPoint:point fromView:self] withEvent:event];
            if (hitView)
            {
                return hitView;
            }
        }
        return self;
    }
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [[self nextResponder] touchesBegan:touches withEvent:event];
//    UIResponder *pResponder = self;
//    while (pResponder) {
//        NSLog(@"%@",pResponder);
//        pResponder = pResponder.nextResponder;
//    }
//    NSLog(@"----");
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
//     Drawing code
    
    
}



@end

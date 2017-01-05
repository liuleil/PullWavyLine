//
//  LLWavyLineView.m
//  PullWavyLine
//
//  Created by leileigege on 2017/1/4.
//  Copyright © 2017年 leileigege. All rights reserved.
//
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#import "LLWavyLineView.h"

@implementation LLWavyLineView

-(void)drawRect:(CGRect)rect{
      CGContextRef context =  UIGraphicsGetCurrentContext();
    [self drawCurveInContext:context];
    [self drawRectInContect:context];

}
-(void)drawRectInContect:(CGContextRef )context{
    //画笔颜色
    CGContextSetStrokeColorWithColor(context, [UIColor cyanColor].CGColor);
    //设置线宽
    CGContextSetLineWidth(context, 1);
    //画矩形
    CGContextAddRect(context, CGRectMake(0, 0, SCREEN_WIDTH, 100));
        //填充颜色
        CGContextSetFillColorWithColor(context, [UIColor cyanColor].CGColor);
        //设置填充路径
        CGContextFillPath(context);
   
    CGContextStrokePath(context);
    
}

-(void)drawCurveInContext:(CGContextRef )context{
    CGContextSetStrokeColorWithColor(context, [UIColor cyanColor].CGColor);
    CGContextSetLineWidth(context, 1);
    CGContextMoveToPoint(context, 0, 100);
 
    CGContextAddQuadCurveToPoint(context, SCREEN_WIDTH/2.0, 100+self.lineHeight, SCREEN_WIDTH, 100);
    NSLog(@"%f",self.lineHeight);
    CGContextSetFillColorWithColor(context, [UIColor cyanColor].CGColor);
    //设置填充路径
    CGContextFillPath(context);
    CGContextStrokePath(context);

}
- (void)setLineHeight:(float)lineHeight
{
    if (_lineHeight != lineHeight)
    {
        _lineHeight = lineHeight;
        
        // 重绘不能直接调用drawRect，调用setNeedsDisplay 会导致drawRect执行
        [self setNeedsDisplay];
    }
    
}

@end

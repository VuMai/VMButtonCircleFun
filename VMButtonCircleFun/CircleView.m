//
//  CircleView.m
//  Popping
//
//  Created by André Schneider on 21.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "CircleView.h"

@interface CircleView()
@property(nonatomic) CAShapeLayer *circleLayer;
@property (nonatomic) CAShapeLayer *lineLayerTopToBottom;
@property (nonatomic) CAShapeLayer *lineLayerBottomToHide;
- (void)addCircleLayer;
@end

@implementation CircleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addCircleLayer];
    }
    return self;
}

#pragma mark - Instance Methods

- (void)setStrokeEnd:(CGFloat)strokeEnd animated:(BOOL)animated
{
    self.circleLayer.strokeEnd = strokeEnd;
}

#pragma mark - Property Setters

- (void)setStrokeColor:(UIColor *)strokeColor
{
    self.circleLayer.strokeColor = strokeColor.CGColor;
    _strokeColor = strokeColor;
}

#pragma mark - Private Instance methods

- (void)addCircleLayer
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
//    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    CGFloat lineWidth = 4.f;
    CGFloat radius = CGRectGetWidth(self.bounds)/2 - lineWidth/2;
    self.circleLayer = [CAShapeLayer layer];
    CGRect rect = CGRectMake(lineWidth/2, lineWidth/2, radius * 2, radius * 2);
    self.circleLayer.path = [UIBezierPath bezierPathWithRoundedRect:rect
                                                  cornerRadius:radius].CGPath;

    self.circleLayer.strokeColor = self.tintColor.CGColor;
    self.circleLayer.fillColor = nil;
    self.circleLayer.lineWidth = lineWidth;
    self.circleLayer.lineCap = kCALineCapRound;
    self.circleLayer.lineJoin = kCALineJoinRound;
    [self.circleLayer setStrokeEnd:0.0f];
    [self.layer addSublayer:self.circleLayer];
    
    self.lineLayerTopToBottom = [CAShapeLayer layer];
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(CGRectGetWidth(self.bounds)/2, -screenHeight)];
    [path1 addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds)/2, 0)];
    self.lineLayerTopToBottom.path = path1.CGPath;
    self.lineLayerTopToBottom.lineWidth = 4.0f;
    [self.lineLayerTopToBottom setStrokeEnd:1.0f];
    self.lineLayerTopToBottom.strokeColor = [UIColor darkGrayColor].CGColor;
    [self.layer addSublayer:self.lineLayerTopToBottom];\
    
    self.lineLayerBottomToHide = [CAShapeLayer layer];
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(CGRectGetWidth(self.bounds)/2, 0)];
    [path2 addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds)/2, -screenHeight)];
    self.lineLayerBottomToHide.path = path2.CGPath;
    self.lineLayerBottomToHide.lineWidth = 4.0f;
    [self.lineLayerBottomToHide setStrokeEnd:1.0f];
    self.lineLayerBottomToHide.strokeColor = [UIColor darkGrayColor].CGColor;
    [self.lineLayerBottomToHide setOpacity:0];
    [self.layer addSublayer:self.lineLayerBottomToHide];
    
    [UIView setAnimationDelegate:self];
}

-(void)animationStrokeColor
{
    CABasicAnimation * swipeLine = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    [swipeLine setValue:@"topToBottom" forKey:@"id"];
    swipeLine.delegate = self;
    swipeLine.duration=1;
    swipeLine.fromValue=[NSNumber numberWithDouble:0.0f];
    swipeLine.toValue=  [NSNumber numberWithDouble:1.0f];
    swipeLine.fillMode = kCAFillModeForwards;
    swipeLine.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    swipeLine.removedOnCompletion=NO;
    self.lineLayerTopToBottom.strokeEnd = 1.0f;
    [self.lineLayerTopToBottom addAnimation:swipeLine forKey:@"topToBottom"];

}

-(void)animationLineBottomToHide
{
    
    CABasicAnimation * swipeLine1 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    [swipeLine1 setValue:@"bottomToHide" forKey:@"id"];
    swipeLine1.duration=1;
    swipeLine1.fromValue=[NSNumber numberWithDouble:1.0f];
    swipeLine1.toValue=  [NSNumber numberWithDouble:0.0f];
    swipeLine1.fillMode = kCAFillModeForwards;
    swipeLine1.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    swipeLine1.removedOnCompletion=YES;
    self.lineLayerBottomToHide.strokeEnd = 0.0f;
    [self.lineLayerBottomToHide addAnimation:swipeLine1 forKey:@"bottomToHide"];
}

-(void)animationLineCircle
{
    CABasicAnimation * swipe = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    [swipe setValue:@"drawCircle" forKey:@"id"];
    swipe.duration=1;
    swipe.fromValue=[NSNumber numberWithDouble:0.0f];
    swipe.toValue=  [NSNumber numberWithDouble:1.0f];
    swipe.fillMode = kCAFillModeForwards;
    swipe.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    swipe.removedOnCompletion=NO;
    self.circleLayer.strokeEnd = 1;
    [self.circleLayer addAnimation:swipe forKey:@"drawCircle"];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if([[anim valueForKey:@"id"] isEqual:@"topToBottom"]) {
        [self.lineLayerBottomToHide setOpacity:1];
        [self.lineLayerTopToBottom setOpacity:0];
//
        [self animationLineBottomToHide];
        [self animationLineCircle];
    }
}

@end

//
//  VMButtonCircleFun.m
//  VMButtonCircleFun
//
//  Created by Vu Mai on 6/2/15.
//  Copyright (c) 2015 VuMai. All rights reserved.
//

#import "VMButtonCircleFun.h"

@interface VMButtonCircleFun()

@property(nonatomic) CAShapeLayer *circleLayer;
@property (nonatomic) CAShapeLayer *lineLayerTopToBottom;
@property (nonatomic) CAShapeLayer *lineLayerBottomToHide;

@property (nonatomic, strong) UIImageView *imgIcon;
@property (nonatomic) float lineWidth;
@end

@implementation VMButtonCircleFun

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.lineWidth = 2.0f;
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
    self.lineLayerBottomToHide.strokeColor = strokeColor.CGColor;
    self.lineLayerTopToBottom.strokeColor = strokeColor.CGColor;
    _strokeColor = strokeColor;
}

-(void)setLineWidthValue:(float)lineWidthTemp
{
    self.lineWidth = lineWidthTemp;
}

#pragma mark - Private Instance methods

- (void)addCircleLayerWithType:(NSInteger)type
{
    CGFloat radius;
    CGFloat lineWidth = self.lineWidth;
    CGRect screenRect = [[UIScreen mainScreen] bounds];
//    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    CGRect rect;
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    switch (type) {
        case VMMakeLocationTop:
            radius = CGRectGetWidth(self.bounds)/2 - lineWidth/2;
            rect = CGRectMake(lineWidth/2, lineWidth/2, radius * 2, radius * 2);
            [path1 moveToPoint:CGPointMake(CGRectGetWidth(self.bounds)/2, -screenHeight)];
            [path1 addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds)/2, 1)];

            [path2 moveToPoint:CGPointMake(CGRectGetWidth(self.bounds)/2, 1)];
            [path2 addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds)/2, -screenHeight)];
            break;
            
        case VMMakeLocationBottom:
            radius = CGRectGetWidth(self.bounds)/2 - lineWidth/2;
            rect = CGRectMake(CGRectGetWidth(self.bounds)-lineWidth/2,CGRectGetHeight(self.bounds)-lineWidth/2, radius * -2, radius * -2);
            
            
            [path1 moveToPoint:CGPointMake(CGRectGetWidth(self.bounds)/2, +screenHeight)];
            [path1 addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)-1)];
            
            [path2 moveToPoint:CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)-1)];
            [path2 addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds)/2, +screenHeight)];
            break;
            
        default:
            break;
    }
    
    self.circleLayer = [CAShapeLayer layer];
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
    
    self.lineLayerTopToBottom.path = path1.CGPath;
    self.lineLayerTopToBottom.lineWidth = self.lineWidth;
    [self.lineLayerTopToBottom setStrokeEnd:1.0f];
    self.lineLayerTopToBottom.strokeColor = [UIColor darkGrayColor].CGColor;
    [self.layer addSublayer:self.lineLayerTopToBottom];\
    
    self.lineLayerBottomToHide = [CAShapeLayer layer];
    self.lineLayerBottomToHide.path = path2.CGPath;
    self.lineLayerBottomToHide.lineWidth = self.lineWidth;
    [self.lineLayerBottomToHide setStrokeEnd:1.0f];
    self.lineLayerBottomToHide.strokeColor = [UIColor darkGrayColor].CGColor;
    [self.lineLayerBottomToHide setOpacity:0];
    [self.layer addSublayer:self.lineLayerBottomToHide];
    
    [UIView setAnimationDelegate:self];
}

-(void)setIconButton:(UIImage *)icon withType:(NSInteger)type withColor:(UIColor*)color
{
    self.imgIcon = [[UIImageView alloc] initWithImage:icon];
    [self.imgIcon setFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds)-CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)-CGRectGetHeight(self.bounds)/2)];
    
    self.imgIcon.image = [icon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.imgIcon setContentMode:UIViewContentModeScaleAspectFit];
    [self.imgIcon setTintColor:color];
    switch (type) {
        case VMMakeLocationTop:
            [self.imgIcon setCenter:CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)/2 -5 )];
            break;
        case VMMakeLocationBottom:
            [self.imgIcon setCenter:CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)/2 +5 )];
            break;
            
        default:
            break;
    }
    
    [self.imgIcon setAlpha:0];
    [self addSubview:self.imgIcon];
}

-(void)addAction:(SEL)selector
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:selector];
    [self addGestureRecognizer:tap];
}

-(void)buildButton
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
    
    [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.imgIcon setAlpha:1];
        [self.imgIcon setCenter:CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)/2)];
    } completion:^(BOOL finished) {
        
    }];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if([[anim valueForKey:@"id"] isEqual:@"topToBottom"]) {
        [self.lineLayerBottomToHide setOpacity:1];
        [self.lineLayerTopToBottom setOpacity:0];
        [self animationLineBottomToHide];
        [self animationLineCircle];
    }
}

@end

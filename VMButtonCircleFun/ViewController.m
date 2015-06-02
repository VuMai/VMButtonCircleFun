//
//  ViewController.m
//  VMButtonCircleFun
//
//  Created by Vu Mai on 6/2/15.
//  Copyright (c) 2015 VuMai. All rights reserved.
//

#import "ViewController.h"
#import "VMButtonCircleFun.h"

#define rgb(r, g, b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self addCircleView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addCircleView
{
    CGRect frame1 = CGRectMake(0, 0, 60, 60);
    VMButtonCircleFun *circleView1 = [[VMButtonCircleFun alloc] initWithFrame:frame1];
    [circleView1 addCircleLayerWithType:VMMakeLocationTop];
    circleView1.strokeColor = rgb(231, 76, 60);
    circleView1.center = CGPointMake(CGRectGetWidth(self.view.bounds)/2 - 100, CGRectGetHeight(self.view.bounds)/2);
    [circleView1 setIconButton:[UIImage imageNamed:@"Layer 14.png"] withType:VMMakeLocationTop withColor:rgb(231, 76, 60)];
    [self.view addSubview:circleView1];
    [circleView1 buildButton];
    
    CGRect frame2 = CGRectMake(0, 0, 90, 90);
    VMButtonCircleFun *circleView2 = [[VMButtonCircleFun alloc] initWithFrame:frame2];
    [circleView2 addCircleLayerWithType:VMMakeLocationBottom];
    circleView2.strokeColor = rgb(46, 204, 113);
    circleView2.center = CGPointMake(CGRectGetWidth(self.view.bounds)/2, CGRectGetHeight(self.view.bounds)/2);
    [circleView2 setIconButton:[UIImage imageNamed:@"Layer 14.png"] withType:VMMakeLocationBottom withColor:rgb(46, 204, 113)];
    [self.view addSubview:circleView2];
    [circleView2 buildButton];
    
    
    CGRect frame3 = CGRectMake(0, 0, 90, 90);
    VMButtonCircleFun *circleView3 = [[VMButtonCircleFun alloc] initWithFrame:frame3];
    [circleView3 addCircleLayerWithType:VMMakeLocationTop];
    circleView3.strokeColor = rgb(155, 89, 182);
    circleView3.center = CGPointMake(CGRectGetWidth(self.view.bounds)/2 + 100, CGRectGetHeight(self.view.bounds)/2);
    [circleView3 setIconButton:[UIImage imageNamed:@"Layer 14.png"] withType:VMMakeLocationTop withColor:rgb(155, 89, 182)];
    [self.view addSubview:circleView3];
    [circleView3 buildButton];
}

@end

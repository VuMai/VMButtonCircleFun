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
    VMButtonCircleFun *circleView1 = [[VMButtonCircleFun alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    [circleView1 addCircleLayerWithType:VMMakeLocationTop];
    circleView1.strokeColor = rgb(243, 106, 106);
    circleView1.center = CGPointMake(CGRectGetWidth(self.view.bounds)/2 - 100, CGRectGetHeight(self.view.bounds)/2);
    [circleView1 setIconButton:[UIImage imageNamed:@"Layer 14.png"] withType:VMMakeLocationTop withColor:rgb(127, 140, 141)];
    [circleView1 setLineWidthValue:1];
    [self.view addSubview:circleView1];
    [circleView1 buildButton];
    
    VMButtonCircleFun *circleView2 = [[VMButtonCircleFun alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    [circleView2 addCircleLayerWithType:VMMakeLocationBottom];
    circleView2.strokeColor = rgb(255, 195, 45);
    circleView2.center = CGPointMake(CGRectGetWidth(self.view.bounds)/2, CGRectGetHeight(self.view.bounds)/2);
    [circleView2 setIconButton:[UIImage imageNamed:@"Layer 15.png"] withType:VMMakeLocationBottom withColor:rgb(127, 140, 141)];
    [circleView2 setLineWidthValue:1];
    [self.view addSubview:circleView2];
    [circleView2 buildButton];
    
    VMButtonCircleFun *circleView3 = [[VMButtonCircleFun alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    [circleView3 addCircleLayerWithType:VMMakeLocationTop];
    circleView3.strokeColor = rgb(74, 220, 239);
    circleView3.center = CGPointMake(CGRectGetWidth(self.view.bounds)/2 + 100, CGRectGetHeight(self.view.bounds)/2);
    [circleView3 setIconButton:[UIImage imageNamed:@"Layer 16.png"] withType:VMMakeLocationTop withColor:rgb(127, 140, 141)];
    [circleView3 setLineWidthValue:1];
    [self.view addSubview:circleView3];
    [circleView3 buildButton];
}

@end

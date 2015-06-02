//
//  ViewController.m
//  VMButtonCircleFun
//
//  Created by Vu Mai on 6/2/15.
//  Copyright (c) 2015 VuMai. All rights reserved.
//

#import "ViewController.h"
#import "CircleView.h"
@interface ViewController ()

@property(nonatomic) CircleView *circleView;
- (void)addCircleView;

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
    CGRect frame = CGRectMake(100.f, 300.f, 300.f, 300.f);
    self.circleView = [[CircleView alloc] initWithFrame:frame];
    self.circleView.strokeColor = [UIColor blueColor];
//    self.circleView.center = self.view.center;
    [self.circleView setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:self.circleView];
    
    [self.circleView animationStrokeColor]; 
}

@end

//
//  witFirstViewController.m
//  WalkItOut
//
//  Created by Matthew Faluotico on 10/20/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import "PedometerViewController.h"

@interface PedometerViewController ()

@end

@implementation PedometerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Set status bar to white
    [self setNeedsStatusBarAppearanceUpdate];
    NSInteger stepsToday = 8000;
    
    
    self.steps = [[witStepData alloc] init];
    
    self.stepsLabel.text = [NSString stringWithFormat:@"%li", (long)stepsToday ];
    self.milesLabel.text = [NSString stringWithFormat:@"%.2f", [self.steps stepsToMiles: stepsToday]];
    self.caloriesLabel.text = [NSString stringWithFormat:@"%.f", [self.steps stepsToCalories: stepsToday]];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


@end

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getMySteps) name:UIApplicationWillEnterForegroundNotification object:nil];
    
    [super viewDidLoad];
    // Set status bar to white
    [self setNeedsStatusBarAppearanceUpdate];
    [self getMySteps];
    
    NSLog(@"View did load");
    
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

- (void) viewFromNumberOfSteps: (NSInteger) numberOfSteps {
    
    NSLog(@"Updating Steps");
    
    StepData * sd = [[StepData alloc]init];
    self.stepsLabel.text = [NSString stringWithFormat:@"%ld", numberOfSteps ];
    double miles = [sd stepsToMiles:numberOfSteps];
    self.milesLabel.text = [NSString stringWithFormat:@"%.2f", miles];
    double cals = [sd stepsToCalories:numberOfSteps];
    self.caloriesLabel.text = [NSString stringWithFormat:@"%.f", cals];
    
    NSInteger units = [[NSUserDefaults standardUserDefaults] integerForKey:goalUnits];
    NSInteger usersGoal = [[NSUserDefaults standardUserDefaults] integerForKey:goal];
    NSInteger closeToGoal = 0;
    
    NSString *unitsString;
    
    if (units == 0 ) {
        closeToGoal = numberOfSteps;
        unitsString = @"steps";
    } else if (units == 1) {
        closeToGoal = miles;
        unitsString = @"miles";
    } else {
        closeToGoal = cals;
        unitsString = @"calories";
    }

    long diff = closeToGoal - usersGoal;
    
    if (diff > 0) {
        self.goalLabel.text = [NSString stringWithFormat:@"You reached your goal of %li %@", usersGoal, unitsString];
    } else {
        diff = -diff;
        self.goalLabel.text = [NSString stringWithFormat:@"You're %li %@ away from your goal", diff, unitsString];
    }
    
    
    
}

- (void) getMySteps {
    MFGetSteps * ma = [[MFGetSteps alloc]init];
    [ma updateLabelToStepsToday:self];
    [ma updateDatabase];
    NSLog(@"Got your steps!");
}

@end

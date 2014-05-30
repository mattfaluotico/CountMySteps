//
//  witFirstViewController.h
//  WalkItOut
//
//  Created by Matthew Faluotico on 10/20/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StepData.h"
#import "MFGetSteps.h"

/**
 *  Main content. Shows the current steps, calories, and miles for todays step data
 */
@interface PedometerViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *appNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *caloriesLabel;

@property (weak, nonatomic) IBOutlet UILabel *milesLabel;

@property (strong, nonatomic) IBOutlet UILabel *stepsLabel;

@property (weak, nonatomic) IBOutlet UIProgressView *goalProgress;

// TODO remove, this is not required as they are static
@property (strong, nonatomic) StepData * steps;

@end

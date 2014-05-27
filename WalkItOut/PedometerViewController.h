//
//  witFirstViewController.h
//  WalkItOut
//
//  Created by Matthew Faluotico on 10/20/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "witStepData.h"

@interface PedometerViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *appNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *caloriesLabel;

@property (weak, nonatomic) IBOutlet UILabel *milesLabel;

@property (weak, nonatomic) IBOutlet UILabel *stepsLabel;

@property (weak, nonatomic) IBOutlet UIProgressView *goalProgress;

@property (strong, nonatomic) witStepData * steps;

@end

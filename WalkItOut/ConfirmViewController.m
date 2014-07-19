//
//  ConfirmViewController.m
//  MySteps
//
//  Created by Matthew Faluotico on 7/16/14.
//  Copyright (c) 2014 Matthew Faluotico. All rights reserved.
//

#import "ConfirmViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ConfirmViewController ()

@end

@implementation ConfirmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.button.layer.backgroundColor = [[UIColor whiteColor] CGColor];
    self.button.layer.cornerRadius = self.button.frame.size.width / 2;
//    [self.button setTitleColor:[[UIColor blackColor] CGColor] forState:UIControlStateNormal];
    
    if ([CMStepCounter isStepCountingAvailable]) {
        self.labelAlert.text = @"Looks like I can count your steps!\nMake sure you allow me to use your Motion Data";
        self.button.enabled = YES;
    } else {
        self.labelAlert.text = @"Your device or device settigs do not allow me to count your steps.";
        self.button.enabled = NO;
        self.button.layer.backgroundColor = [[UIColor darkGrayColor] CGColor];
        [self.button setTitle:@":(" forState:UIControlStateDisabled];
    }
    
    NSUserDefaults  *defaultSettings = [NSUserDefaults standardUserDefaults ];
    [defaultSettings setBool:@YES forKey:@"launchedPreviously"];
    
    // set user defualts
    [defaultSettings setObject:@"5" forKey:heightFeet];
    [defaultSettings setObject:@"8" forKey:heightInches];
    [defaultSettings setObject:@"10000" forKey:goal];
    [defaultSettings setObject:@"150" forKey:weight];
    [defaultSettings setObject:@"0" forKey:goalUnits];
    [defaultSettings setObject:@"0" forKey:male];
    
    [defaultSettings synchronize];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

//
//  witTabBar.m
//  WalkItOut
//
//  Created by Matthew Faluotico on 10/21/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import "witTabBar.h"

@interface witTabBar ()

@end

@implementation witTabBar

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    Set appeatence
    [[UITabBar appearance ] setTintColor: [UIColor whiteColor]];
    
    // Ensure that the user if first asked to enter data
    // First time launching application
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"launchedPreviously"]) {
        [self setSelectedIndex:1];
        // Set best, total, and aveage to zero
        NSUserDefaults *myDefaults = [NSUserDefaults standardUserDefaults];
        [myDefaults setInteger:0 forKey:averageDaySteps];
        [myDefaults setObject:@0 forKey:totalSteps];
        [myDefaults setInteger:0 forKey:bestDaySteps];
        [myDefaults setObject:[[NSDate alloc] init] forKey:bestDayDate];
        
    } else {
        [self setSelectedIndex:2];
        [[NSUserDefaults standardUserDefaults ] setBool:@YES forKey:@"launchedPreviously"];
    }
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

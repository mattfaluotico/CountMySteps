//
//  MyInfoViewController.m
//  WalkItOut
//
//  Created by Matthew Faluotico on 10/20/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import "MyInfoViewController.h"

@interface MyInfoViewController ()

@end

@implementation MyInfoViewController

// When the view becomes available
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"launchedPreviously"]) {
        [self loadSettings];
    }
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  Load all the user settings into the application view
 */
- (void) loadSettings {
	
	NSUserDefaults *defaultSettings = [NSUserDefaults standardUserDefaults];

//	// get height inches
    self.fieldHeightFeet.text = [defaultSettings objectForKey:heightFeet] ;
    self.fieldHeightInches.text = [defaultSettings objectForKey:heightInches];
    self.fieldWeight.text = [defaultSettings objectForKey:weight];
    self.fieldGoal.text = [defaultSettings objectForKey:goal];
    self.segmentMaleFemale.selectedSegmentIndex = [[defaultSettings objectForKey:male] integerValue];
    self.segmentStepsMilesCalories.selectedSegmentIndex = [[defaultSettings objectForKey:goalUnits] integerValue];

	
}

// set status bar to white
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

// releases the keyboard
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


// Erase all data from the Database.
- (IBAction)buttonReset:(UIButton *)sender {
    
}

- (IBAction)buttonUpdate:(UIButton *)sender {
    NSUserDefaults *defaultSettings = [NSUserDefaults standardUserDefaults];
    [defaultSettings setObject:self.fieldHeightFeet.text forKey:heightFeet];
    [defaultSettings setObject:self.fieldHeightFeet.text forKey:heightInches];
    [defaultSettings setObject:self.fieldGoal.text forKey:goal];
    [defaultSettings setObject:self.fieldWeight.text forKey:weight];
    
    if (self.segmentMaleFemale.selectedSegmentIndex == 0) {
        [defaultSettings setObject:@"0" forKey:male];
    } else {
        [defaultSettings setObject:@"1" forKey:male];
    }
    
    NSInteger goalUnit = self.segmentStepsMilesCalories.selectedSegmentIndex;
    if (goalUnit == 0) {
        [defaultSettings setObject:@"0" forKey:goalUnits];
    } else if (goalUnit == 1) {
        [defaultSettings setObject:@"1" forKey:goalUnits];
    } else {
        [defaultSettings setObject:@"2" forKey:goalUnits];
    }
    
    
}
@end

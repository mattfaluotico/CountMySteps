//
//  MyInfoViewController.h
//  WalkItOut
//
//  Created by Matthew Faluotico on 10/20/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyInfoViewController : UIViewController

- (IBAction)buttonReset:(UIButton *)sender;

- (IBAction)buttonUpdate:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentStepsMilesCalories;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentMaleFemale;
@property (weak, nonatomic) IBOutlet UITextField *fieldHeightFeet;
@property (weak, nonatomic) IBOutlet UITextField *fieldHeightInches;
@property (weak, nonatomic) IBOutlet UITextField *fieldWeight;
@property (weak, nonatomic) IBOutlet UITextField *fieldGoal;



@end

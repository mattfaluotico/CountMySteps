//
//  witSecondViewController.h
//  WalkItOut
//
//  Created by Matthew Faluotico on 10/20/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StepData.h"
#import "StepDay.h"
#import "witCell.h"

@interface StatisticsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *bestDayLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *averageLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentStepsMilesCalories;

@property (nonatomic, strong) NSArray *stepHistory;

@property (strong, nonatomic) IBOutlet UITableView *statsTable;

- (IBAction)changeUnits:(id)sender;

@end

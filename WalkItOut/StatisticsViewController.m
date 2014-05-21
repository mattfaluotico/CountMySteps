//
//  witSecondViewController.m
//  WalkItOut
//
//  Created by Matthew Faluotico on 10/20/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import "StatisticsViewController.h"
#import "PedometerViewController.h"
#import "witStepData.h"

@interface StatisticsViewController ()

- (void) setBestTotalAndAverage;

@property (strong, nonatomic) NSArray *stepHistoryArray;
@property witStepData * steps;

@end

@implementation StatisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    _steps = [[witStepData alloc] init];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// set statusbar color to white
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark Table

// sets the length of the table to the length of steps in the array
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

	NSInteger c = [self.stepHistoryArray count];
	return (c < 1) ? 1 : c;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
		
	NSString *cellIdentifier = @"Cell";
	
	UITableViewCell *cellAtIndex = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	if (cellAtIndex == nil) {
		cellAtIndex = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellIdentifier];
	}
	
	double cellValue = 0;
	cellValue = [[self.stepHistoryArray objectAtIndex:[indexPath row]][@"steps"] doubleValue];
	NSString *date = [self.stepHistoryArray objectAtIndex:[indexPath row]][@"date"];
	
	
	switch (self.segmentStepsMilesCalories.selectedSegmentIndex) {
			// 0 is steps
		case 0 : cellValue = cellValue;
			break;
		case 1: cellValue = [_steps stepsToMiles: cellValue]; // TODO: To Miles
			break;
		case 2: cellValue = [_steps stepsToCalories: cellValue]; // TODO: To Calories
			break;
        default:
			cellValue = 0;
			break;
	}
	
	cellAtIndex.textLabel.text = date;
	cellAtIndex.detailTextLabel.text = [NSString stringWithFormat:@"%f", cellValue];
	
	
	return cellAtIndex;
}

- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
		
	
}

- (id) initWithCoder:(NSCoder *)aDecoder {
	
	self = [super initWithCoder:aDecoder];
	
	if (self) {
		self.stepHistoryArray = [StatisticsViewController loadStepData];
	}
	
	return self;
}

+ (NSArray *) loadStepData {
	
	NSString *stepHistoryPlistPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
	stepHistoryPlistPath = [stepHistoryPlistPath stringByAppendingString:@"StepHistory.plist"];
	
	NSArray *stepArray = [[NSArray alloc] initWithContentsOfFile:stepHistoryPlistPath];
	
	return stepArray;
}

@end

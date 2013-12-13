//
//  witSecondViewController.m
//  WalkItOut
//
//  Created by Matthew Faluotico on 10/20/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import "StatisticsViewController.h"
#import "PedometerViewController.h"

@interface StatisticsViewController ()

- (void) setBestTotalAndAverage;
- (void) setBestDayDate;
- (void) setBestDayValue;
- (void) setTotaValue;
- (void) setAverageValue;

@property (strong, nonatomic) NSArray *stepHistoryArray;

@end

@implementation StatisticsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
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
		
	NSInteger cellValue = 0;
	switch (self.segmentStepsMilesCalories.selectedSegmentIndex) {
			
			// 0 is steps
		case 0 : cellValue = [[self.stepHistoryArray objectAtIndex:[indexPath row]] integerValue];
			break;
		case 1: cellValue = 0; // TODO: To Miles
			break;
		case 2: cellValue = 0; // TODO: To Calories
			break;
			default:
			cellValue = 0;
			break;
			
	}
	return NULL;
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

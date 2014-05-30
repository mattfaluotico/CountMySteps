//
//  witSecondViewController.m
//  WalkItOut
//
//  Created by Matthew Faluotico on 10/20/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import "StatisticsViewController.h"
#import "PedometerViewController.h"
#import "StepData.h"
#import "witAppDelegate.h"


@interface StatisticsViewController ()

- (void) setBestTotalAndAverage;

@property StepData * steps;
@property NSDateFormatter * df;

@end

@implementation StatisticsViewController

@synthesize stepHistory;
@synthesize df;

- (id) initWithCoder:(NSCoder *)aDecoder {
	
	self = [super initWithCoder:aDecoder];
	
	if (self) {
        self.statsTable = [[UITableView alloc] initWithCoder:aDecoder];
        
        [self loadStepData];
        
        _steps = [[StepData alloc] init];
        
        
	}
	
	return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    
    df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"MM/dd/yyyy"];
    
    NSUserDefaults *myDefs = [NSUserDefaults standardUserDefaults];
    self.bestDayLabel.text = [NSString stringWithFormat:@"%ld steps on %@", [myDefs integerForKey:bestDaySteps], [df stringFromDate: (NSDate* ) [myDefs objectForKey:bestDayDate]]];
    self.totalLabel.text = [NSString stringWithFormat:@"%lld" , [[myDefs objectForKey:totalSteps] longLongValue]];
                              
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setBestTotalAndAverage {
    


}

// set statusbar color to white
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


#pragma mark Table

// sets the length of the table to the length of steps in the array
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

	NSInteger c = [self.stepHistory count];
	return (c < 1) ? 0 : c;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
		
	NSString *cellIdentifier = @"witCell";
	
	witCell *cellAtIndex = (witCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	if (cellAtIndex == nil) {
		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"Cell" owner:self options:nil];
        cellAtIndex = [nib objectAtIndex:0];
	}
	
    
    
	double cellValue = 0;
    StepDay *day = [self.stepHistory objectAtIndex:indexPath.row];
	cellValue = [day.steps doubleValue];
    
    
	NSString *date = [df stringFromDate:day.day];
	
	
	switch (self.segmentStepsMilesCalories.selectedSegmentIndex) {
			// 0 is steps
		case 0 : {
            cellValue = cellValue;
            cellAtIndex.stepData.text = [NSString stringWithFormat:@"%.f steps", cellValue];
			break;
        }
		case 1: {
            cellValue = [_steps stepsToMiles: cellValue];
            cellAtIndex.stepData.text = [NSString stringWithFormat:@"%.2f mi", cellValue];
            
			break;
        }
		case 2: {
            cellValue = [_steps stepsToCalories: cellValue]; // TODO: To Calories
            cellAtIndex.stepData.text = [NSString stringWithFormat:@"%.f cal", cellValue];
			break;
        }
        default:
			cellValue = 0;
			break;
	}
	
	cellAtIndex.dateData.text = date;
	
	
	return cellAtIndex;
}

- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
		
	
}


#pragma mark load data

- (void) loadStepData {
	   
//    if (_managedObjectContext == nil) {
//        _managedObjectContext = [(witAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
//    }
    self.stepHistory =  [(witAppDelegate *)[[UIApplication sharedApplication] delegate] fetchedResultsController].fetchedObjects;
    
    self.title = @"Step History";
}

- (IBAction)changeUnits:(id)sender {
    [self.statsTable reloadData];
}
@end

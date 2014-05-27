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
#import "witAppDelegate.h"


@interface StatisticsViewController ()

- (void) setBestTotalAndAverage;

@property witStepData * steps;

@end

@implementation StatisticsViewController

@synthesize stepHistory;

- (id) initWithCoder:(NSCoder *)aDecoder {
	
	self = [super initWithCoder:aDecoder];
	
	if (self) {
        self.statsTable = [[UITableView alloc] initWithCoder:aDecoder];
        
        [self loadStepData];
        
        _steps = [[witStepData alloc] init];
        
        
	}
	
	return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    
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

	NSInteger c = [self.stepHistory count];
	return (c < 1) ? 1 : c;
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
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"MM/dd/yyyy"];
    
	NSString *date = [df stringFromDate:day.day];
	
	
//	switch (self.segmentStepsMilesCalories.selectedSegmentIndex) {
//			// 0 is steps
//		case 0 : cellValue = cellValue;
//			break;
//		case 1: cellValue = 12; //[_steps stepsToMiles: cellValue]; // TODO: To Miles
//			break;
//		case 2: cellValue = 13; // [_steps stepsToCalories: cellValue]; // TODO: To Calories
//			break;
//        default:
//			cellValue = 0;
//			break;
//	}
	
	cellAtIndex.dateData.text = date;
	cellAtIndex.stepData.text = [NSString stringWithFormat:@"%.2f", cellValue];
	
	
	return cellAtIndex;
}

- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
		
	
}

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"StepDay" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"day" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return _fetchedResultsController;
}


#pragma mark load data

- (void) loadStepData {
	
    if (_managedObjectContext == nil) {
        _managedObjectContext = [(witAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    }
    
        
    
    NSFetchRequest *fetched = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"StepDay" inManagedObjectContext:[self.fetchedResultsController managedObjectContext]];
    [fetched setEntity:entity];
    
    NSError *e;
    self.stepHistory = [_managedObjectContext executeFetchRequest:fetched error:&e];
    self.title = @"Step History";
}

@end

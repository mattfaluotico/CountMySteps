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


@interface StatisticsViewController () {
    BOOL set;
    NSInteger best;
    NSInteger average;
    NSDate *bestDay;
    double total;
}

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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadStepData) name:@"updatedDatabase" object:nil];
    
	
	return self;
}

- (void) viewDidAppear:(BOOL)animated {
//    self.stepHistory = [(witAppDelegate *)[[UIApplication sharedApplication] delegate] fetchedResultsController].fetchedObjects;
    [self.statsTable reloadData];
    
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    
    df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"MM/dd/yyyy"];
    

    
    NSUserDefaults *myDefs = [NSUserDefaults standardUserDefaults];
    self.bestDayLabel.text = [NSString stringWithFormat:@"%d steps on %@", [myDefs integerForKey:bestDaySteps], [df stringFromDate: (NSDate* ) [myDefs objectForKey:bestDayDate]]];
    self.totalLabel.text = [NSString stringWithFormat:@"%lld" , [[myDefs objectForKey:totalSteps] longLongValue]];
    
    [self setBestTotalAndAverage];
                              
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setBestTotalAndAverage {

    if (!set) {
    
        total = 0;
        best = 0;
        average = 0;
        
        for (NSObject *day in self.stepHistory) {
            NSInteger steps = [((StepDay* )day).steps integerValue];
            total += steps;
            if (best < steps) {
                best = steps;
                bestDay = ((StepDay*)day).day;
            }
        }
        
        average = total / [self.stepHistory count];
    
        set = YES;
        
    }
    
    switch (self.segmentStepsMilesCalories.selectedSegmentIndex) {
        case 0:
        {
            self.bestDayLabel.text = [NSString stringWithFormat:@"Best: %d steps on %@", best, [df stringFromDate:bestDay]];
            self.totalLabel.text = [NSString stringWithFormat:@"Total: %.f steps", total];
            self.averageLabel.text = [NSString stringWithFormat:@"Average: %d steps per day", average];
        }
            break;
        case 1:
        {
            self.bestDayLabel.text = [NSString stringWithFormat:@"Best: %.2f miles on %@", [self.steps stepsToMiles:best], [df stringFromDate:bestDay]];
            self.totalLabel.text = [NSString stringWithFormat:@"Total: %.2f miles", [self.steps stepsToMiles:total]];
            self.averageLabel.text = [NSString stringWithFormat:@"Average: %.2f mi per day", [self.steps stepsToMiles:average]];
        }
            break;
        case 2: {
            self.bestDayLabel.text = [NSString stringWithFormat:@"Best: %.f calories on %@", [self.steps stepsToCalories:best], [df stringFromDate:bestDay]];
            self.totalLabel.text = [NSString stringWithFormat:@"Total: %.f calories", [self.steps stepsToCalories:total]];
            self.averageLabel.text = [NSString stringWithFormat:@"Average: %.f cal per day", [self.steps stepsToCalories:average]];
        }
            break;
        default: {
//            set steps
        }
    }
    

        
    
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

#pragma mark load data

- (void) loadStepData {
    
    NSManagedObjectContext *context = ((witAppDelegate *)[[UIApplication sharedApplication] delegate]).managedObjectContext;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSSortDescriptor *sortByDate = [[NSSortDescriptor alloc] initWithKey:@"day" ascending:NO];
    
    [request setEntity:[NSEntityDescription entityForName:@"StepDay" inManagedObjectContext:context]];
    [request setSortDescriptors:[[NSArray alloc] initWithObjects:sortByDate, nil]];
    
    NSError *e;
    self.stepHistory = [context executeFetchRequest:request error:&e];
    self.title = @"Step History";
    [self.statsTable reloadData];
}

- (IBAction)changeUnits:(id)sender {
    [self.statsTable reloadData];
    [self setBestTotalAndAverage];
}
@end

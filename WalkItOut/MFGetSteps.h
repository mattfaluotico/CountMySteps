//
//  MFGetSteps.h
//  WalkItOut
//
//  Created by Matthew Faluotico on 5/28/14.
//  Copyright (c) 2014 Matthew Faluotico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>
#import "StepData.h"
#import "witAppDelegate.h"

@interface MFGetSteps : NSObject

@property NSInteger stepsToday;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (id) init;

- (void) updateDatabase;

- (void) updateLabelToStepsToday: (UILabel *) thisLabel;

+ (void)updateStepsTodayFromHistoryLive;

@end

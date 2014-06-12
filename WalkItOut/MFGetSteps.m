//
//  MFGetSteps.m
//  WalkItOut
//
//  Created by Matthew Faluotico on 5/28/14.
//  Copyright (c) 2014 Matthew Faluotico. All rights reserved.
//

#import "MFGetSteps.h"


@implementation MFGetSteps {
    CMStepCounter * _stepCounter;
    NSOperationQueue * _stepOperationQueue;
    StepData *sd;
}

- (id) init {
    
    if ([CMStepCounter isStepCountingAvailable]) {
    
        self = [super init];
        
        if (self) {
            _stepCounter = [[CMStepCounter alloc]init];
            _stepOperationQueue = [[NSOperationQueue alloc] init];
            _managedObjectContext = ((witAppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
            sd = [[StepData alloc]init];
        }
        
    } else {
        NSLog(@"Step counting not available");
        self = nil;
    }
    
    return self;
}

#pragma mark Core Functionality

- (void) updateDatabase {
    
    __block NSManagedObjectContext *context = ((witAppDelegate *)[[UIApplication sharedApplication] delegate]).managedObjectContext;
    
    __block NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:[NSEntityDescription entityForName:@"StepDay" inManagedObjectContext:context]];
    
    // for last 7 days
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    
    NSDateComponents *components = [calendar components:NSYearCalendarUnit| NSMonthCalendarUnit| NSDayCalendarUnit fromDate:now];
    // start of today
    NSDate *startOfDay = [calendar dateFromComponents:components];
    
    NSDate * previousDay = now;
    
    for (int daysBehind = 0; daysBehind < 7; daysBehind ++) {
        
        [_stepCounter queryStepCountStartingFrom:startOfDay
                                              to:previousDay
                                         toQueue:_stepOperationQueue
                                     withHandler:^(NSInteger numberOfSteps, NSError *error) {
                                        if (!error) {
                                            
                                            NSError *err;
                                            
                                            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"day == %@", startOfDay];
                                            
                                            [request setPredicate:predicate];
                                            
                                            NSArray *stepData = [context executeFetchRequest:request error:&err];
                                            
                                            // Day does not, thus we add a new entry
                                            if ([stepData count] != 0) {
                                                StepDay *today = [stepData objectAtIndex:0];
                                                today.steps = [NSNumber numberWithLong:numberOfSteps];
                                                [context save:&err];
                                            } else {
                                                StepDay *thisDay = [NSEntityDescription
                                                                    insertNewObjectForEntityForName:@"StepDay" inManagedObjectContext:context];
                                                [thisDay setValue:[NSNumber numberWithLong:numberOfSteps] forKey:@"steps"];
                                                [thisDay setValue:startOfDay forKey:@"day"];
                                                
                                                [context save:&err];
                                            }
                                            
                                            if (daysBehind == 6) {
                                                [[NSNotificationCenter defaultCenter]
                                                 postNotificationName:@"updatedDatabase"
                                                 object:self];
                                            }
                                            
                                         } else {
                                             NSLog(@"error");
                                         }
                                     }];
        
        
        previousDay = startOfDay;
        // subtract one day
        startOfDay = [startOfDay dateByAddingTimeInterval:-86400];
    }
    
}

- (void) updateLabelToStepsToday: (PedometerViewController *) thisClassRef {
    
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    // converts date 00 today
    NSDateComponents *components = [calendar components:NSYearCalendarUnit| NSMonthCalendarUnit| NSDayCalendarUnit fromDate:now];
    
    NSDate *startOfDay = [calendar dateFromComponents:components];
        
    [_stepCounter queryStepCountStartingFrom:startOfDay
                                          to:now
                                     toQueue:_stepOperationQueue
                                 withHandler:^(NSInteger numberOfSteps, NSError *error) {
                                     if (error) {
                                         thisClassRef.stepsLabel.text = @"-1";
                                         thisClassRef.goalLabel.text = @"Goal is far away...";
                                     } else {
                                         
                                         [thisClassRef viewFromNumberOfSteps:numberOfSteps];
 
                                     }
                                 }];
    
}


@end

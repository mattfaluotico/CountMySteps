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
    
}

- (id) init {
    
    if ([CMStepCounter isStepCountingAvailable]) {
    
        self = [super init];
        
        if (self) {
            _stepCounter = [[CMStepCounter alloc]init];
            _stepOperationQueue = [[NSOperationQueue alloc] init];
            _managedObjectContext = ((witAppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
            _fetchedResultsController = ((witAppDelegate *)[UIApplication sharedApplication].delegate).fetchedResultsController;
            
        }
        
    } else {
        NSLog(@"Step counting not available");
        self = nil;
    }
    
    return self;
}

#pragma mark Core Functionality

- (void) updateDatabase {
    
    // for last 7 days
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    
    NSDateComponents *components = [calendar components:NSYearCalendarUnit| NSMonthCalendarUnit| NSDayCalendarUnit fromDate:now];
    // start of today
    NSDate *startOfDay = [calendar dateFromComponents:components];
    
    NSDate * previousDay = now;
    
    
    for (int daysBehind = 0; daysBehind < 7; daysBehind ++) {
        
        
        
        __block NSDate * __startOfToday = startOfDay;
        
        [_stepCounter queryStepCountStartingFrom:previousDay
                                              to:startOfDay
                                         toQueue:_stepOperationQueue
                                     withHandler:^(NSInteger numberOfSteps, NSError *error) {
                                         if (error) {
                                             
                                         } else {
                                             // Add entry if date is not in the database
                                         }
                                     }];
        
        
        previousDay = startOfDay;
        startOfDay = [startOfDay dateByAddingTimeInterval:-86400];
    }
}

- (void) updateLabelToStepsToday: (UILabel *) thisLabel {
    
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
                                         thisLabel.text = @"-1";
                                     } else {
                                         thisLabel.text = [NSString stringWithFormat:@"%ld", numberOfSteps ];
                                     }
                                 }];
    
}

+ (void)updateStepsTodayFromHistoryLive {
    

}


@end

//
//  witStepData.h
//  WalkItOut
//
//  Created by Matthew Faluotico on 12/12/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Math for converting steps into miles and calories as the data is stored in 'steps'
 */
@interface witStepData : NSObject

@property NSArray *stepHistoryData;
@property NSInteger heightInches;
@property NSInteger weight;
// Steps is the standardize measurement

- (id) init;

- (id) initWithSteps: (NSInteger) steps;

- (double) stepsToMiles: (NSInteger) steps;

- (double) stepsToCalories:(NSInteger) steps;

- (double) stepsPerMileForHeight:(NSInteger) steps;

@end

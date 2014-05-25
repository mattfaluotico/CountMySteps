//
//  witStepData.h
//  WalkItOut
//
//  Created by Matthew Faluotico on 12/12/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface witStepData : NSObject

@property NSArray *stepHistoryData;
@property NSInteger heightInches;
@property NSInteger weight;
// Steps is the standardize measurement
@property NSInteger steps;

- (id) init;

- (id) initWithSteps: (NSInteger) steps;

-(double) stepsToMiles;

-(double) stepsToCalories;

-(double) stepsPerMileForHeight;

@end

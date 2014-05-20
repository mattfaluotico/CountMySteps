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

- (id) init;

-(double) stepsToMiles: (double) steps;

-(double) stepsToCalories: (double) steps;

-(double) stepsPerMileForHeight;

@end

//
//  witStepData.m
//  WalkItOut
//
//  Created by Matthew Faluotico on 12/12/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import "StepData.h"

#define MILES_INCHES 63360

@implementation StepData

// TODO: Make these all static methods that take steps and return a value 

- (id) init {
		
	self = [super init];
    
//    Set the height and weight
	if (self) {
		
		self.weight = [[[NSUserDefaults standardUserDefaults] objectForKey:weight] integerValue];
		self.heightInches = [[[NSUserDefaults standardUserDefaults] objectForKey:heightFeet] integerValue] * 12;
		self.heightInches = self.heightInches + [[[NSUserDefaults standardUserDefaults] objectForKey:heightInches]integerValue];
	}
	
	return self;
}

-(double) stepsToCalories: (NSInteger) steps{
	
	// Livestrong data = .57 * weight = calories per mile
	return [self stepsToMiles: steps] * ([self weight] * 0.57);
}

- (double) stepsToMiles: (NSInteger) steps {
	
	return steps / [self stepsPerMile: steps];
}

- (double) stepsPerMile: (NSInteger ) steps {
	
    if ([[NSUserDefaults standardUserDefaults] boolForKey:male] ) // male
        return MILES_INCHES / (0.415 * [self heightInches]);
    else  // Female
        return MILES_INCHES / (0.413 * [self heightInches]);
	
}



@end

//
//  witStepData.m
//  WalkItOut
//
//  Created by Matthew Faluotico on 12/12/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import "witStepData.h"

#define MILES_INCHES 63360

@implementation witStepData

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

-(id) initWithSteps:(NSInteger)steps  {
    
    self = [self init];
    [self setSteps:steps];
    return self;
}

-(double) stepsToCalories{
	
	// Livestrong data = .57 * weight = calories per mile
	return [self stepsToMiles] * ([self weight] * 0.57);
}

- (double) stepsToMiles {
	
	return [self steps] / [self stepsPerMileForHeight];
}

- (double) stepsPerMileForHeight {
	
    if ([[NSUserDefaults standardUserDefaults] boolForKey:male] ) // male
        return MILES_INCHES / (0.415 * [self heightInches]);
    else  // Female
        return MILES_INCHES / (0.413 * [self heightInches]);
	
}

@end

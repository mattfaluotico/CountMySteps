//
//  witStepData.m
//  WalkItOut
//
//  Created by Matthew Faluotico on 12/12/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import "witStepData.h"

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

-(double) stepsToCalories:(double)steps {
	
	// Livestrong data = .57 * weight = calories per mile
	return [self stepsToMiles:steps] * (self.weight * 0.57);
}

- (double) stepsToMiles:(double)steps {
	
	return steps / [self stepsPerMileForHeight];
}

- (double) stepsPerMileForHeight {
	
	return (-34.012 * self.heightInches) + 4545.7;
	
}

@end

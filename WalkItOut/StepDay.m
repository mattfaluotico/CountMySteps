//
//  StepDay.m
//  WalkItOut
//
//  Created by Matthew Faluotico on 5/26/14.
//  Copyright (c) 2014 Matthew Faluotico. All rights reserved.
//

#import "StepDay.h"


@implementation StepDay

@dynamic day;
@dynamic steps;


- (NSString *) description {
    
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    
    [df setDateFormat:@"dd-MM-yyyy at hh:mm"];
    
    return [NSString stringWithFormat:@" %@ steps on %@", self.steps, [df stringFromDate:self.day]];

}

@end

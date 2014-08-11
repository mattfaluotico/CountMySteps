//
//  StepDay.h
//  MySteps
//
//  Created by Matthew Faluotico on 8/11/14.
//  Copyright (c) 2014 Matthew Faluotico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface StepDay : NSManagedObject

@property (nonatomic, retain) NSDate * day;
@property (nonatomic, retain) NSNumber * steps;

@end

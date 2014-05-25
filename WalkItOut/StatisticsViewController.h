//
//  witSecondViewController.h
//  WalkItOut
//
//  Created by Matthew Faluotico on 10/20/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "witStepData.h"

@interface StatisticsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *bestDayLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *averageLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentStepsMilesCalories;
//@property (weak, nonatomic) witStepData *stepData;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;

@end

//
//  witCell.h
//  WalkItOut
//
//  Created by Matthew Faluotico on 5/27/14.
//  Copyright (c) 2014 Matthew Faluotico. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  Custom Cell for showing Date and Steps
 */
@interface witCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *dateData;

@property (weak, nonatomic) IBOutlet UILabel *stepData;

@end

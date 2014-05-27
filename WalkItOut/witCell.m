//
//  witCell.m
//  WalkItOut
//
//  Created by Matthew Faluotico on 5/27/14.
//  Copyright (c) 2014 Matthew Faluotico. All rights reserved.
//

#import "witCell.h"

@implementation witCell

@synthesize stepData;
@synthesize dateData;   

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    self.backgroundColor = [UIColor clearColor];
    return self;
}

@end

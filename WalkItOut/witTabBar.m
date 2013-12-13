//
//  witTabBar.m
//  WalkItOut
//
//  Created by Matthew Faluotico on 10/21/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import "witTabBar.h"
@interface witTabBar ()

@end

@implementation witTabBar

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setSelectedIndex:1];
	
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

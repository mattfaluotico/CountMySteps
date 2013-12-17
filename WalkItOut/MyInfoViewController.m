//
//  MyInfoViewController.m
//  WalkItOut
//
//  Created by Matthew Faluotico on 10/20/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import "MyInfoViewController.h"

@interface MyInfoViewController ()

@end

@implementation MyInfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// storyboard init method
- (id) initWithCoder:(NSCoder *)aDecoder {
	
	self = [super initWithCoder:aDecoder];
	
	if (self) {
			
		[self loadSettings];
		
	}
	
	return self;
}

// loads the user values into the fields
- (void) loadSettings {
	
	NSUserDefaults *defaultSettings = [NSUserDefaults standardUserDefaults];
	
	// get height inches
	[[NSUserDefaults standardUserDefaults] objectForKey:@"heightFeet"];
	
	// get height feet
	
}

// set status bar to white
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

// releases the keyboard
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)buttonReset:(UIButton *)sender {
}

- (IBAction)buttonUpdate:(UIButton *)sender {
}
@end

//
//  witAppDelegate.m
//  WalkItOut
//
//  Created by Matthew Faluotico on 10/20/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import "witAppDelegate.h"
#import "PedometerViewController.h"



@implementation witAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

	if ([[NSUserDefaults standardUserDefaults] boolForKey:@"launchedPreviously"]) {
		
		// launches before
		
	} else {
		
		[[NSUserDefaults standardUserDefaults ] setObject:@YES forKey:@"launchedPreviously"];
		[[NSUserDefaults standardUserDefaults] synchronize];
		
		// first launch.
		
		// set all the defaults.
		
		NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
		[def setObject:@5 forKey:heightFeet];
		[def setObject:@9 forKey:heightInches];
		[def setObject:@145 forKey:weight];
		[def setObject:@7800 forKey:goal];
		[def setObject:@"steps"	forKey:goalUnits];
		[def setObject:@YES forKey:male];
		[def setObject:@0 forKey:bestDaySteps];
		[def setObject:@0 forKey:averageDaySteps];
		[def setObject:@0 forKey:totalSteps];
		
		
	}
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

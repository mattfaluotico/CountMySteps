//
//  WriteToFile.m
//  WalkItOut
//
//  Created by Matthew Faluotico on 12/11/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import "WriteToFile.h"

@implementation WriteToFile

- (id) initWithFileName:(NSString *)name {
	
	self = [super init];
	
	if (self)  {
		
		NSFileManager *fileManager = [NSFileManager defaultManager];
		
		self.path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
		self.path = [self.path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@", name]];
		
		if (![fileManager fileExistsAtPath:self.path]) {
			NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"WalkItOut-Info" ofType:@"plist"];
			//[fileManager copyItemAtPath:sourcePath toPath:destPath error:nil];
        
			[@"Test" writeToFile:self.path atomically:NO encoding:NSStringEncodingConversionAllowLossy error:nil];
		}
		
	}
	
	
	return self;
}

// Writes all of the step to a file 
-(void) writeData:(NSString *)data {
		
	[data writeToFile:self.path atomically:NO encoding:NSStringEncodingConversionAllowLossy error:nil];
	
}

@end

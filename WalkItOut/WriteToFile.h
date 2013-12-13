//
//  WriteToFile.h
//  WalkItOut
//
//  Created by Matthew Faluotico on 12/11/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WriteToFile : NSObject

@property (weak, nonatomic) NSString *path;

- (id) initWithFileName: (NSString *) name; 

- (void) writeData: (NSString *) data;

@end

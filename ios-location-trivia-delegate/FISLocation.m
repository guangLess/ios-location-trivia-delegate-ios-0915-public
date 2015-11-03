//
//  FISLocation.m
//  ios-location-trivia-delegate
//
//  Created by Timothy Clem on 6/23/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISLocation.h"

@implementation FISLocation

-(instancetype)initWithName:(NSString *)name trivia:(NSArray *)trivia
{
    self = [super init];
    if(self) {
        self.name = name;
        self.trivia = [trivia mutableCopy];
    }
    return self;
}

@end

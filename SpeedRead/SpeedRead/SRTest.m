//
//  SRTest.m
//  SpeedRead
//
//  Created by Rodrigo Soldi Lopes on 06/02/15.
//  Copyright (c) 2015 SpeedRead. All rights reserved.
//

#import "SRTest.h"

@implementation SRTest

-(BOOL)evaluate
{
    if ([self.rigthAnswer isEqualToString: self.givenAnswer]) {
        return YES;
    }
    else return NO;
}

@end

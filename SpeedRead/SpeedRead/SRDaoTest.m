//
//  SRDaoTest.m
//  SpeedRead
//
//  Created by Rodrigo Soldi Lopes on 06/02/15.
//  Copyright (c) 2015 SpeedRead. All rights reserved.
//

#import "SRDaoTest.h"
#import "SRProperties.h"

@implementation SRDaoTest

-(void)create:(SRTest *)test
{
    NSError *error;
    
    NSManagedObjectContext *context = [[SRProperties sharedInstance] managedObjectContext];
    
    SRTest *cTest = [NSEntityDescription insertNewObjectForEntityForName:TESTS inManagedObjectContext:context];
    [cTest setQuestion: [test question]];
    [cTest setGivenAnswer: [test givenAnswer]];
    [cTest setRigthAnswer: [test rigthAnswer]];
    
    [context save: &error];
}

-(SRTest *)read:(SRTest *)test
{
    return nil;
}

-(void)update:(SRTest *)test
{
    
}

-(void)erase:(SRTest *)test
{
    
}

@end

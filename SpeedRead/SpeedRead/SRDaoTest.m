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
    NSEntityDescription *entityTest = [NSEntityDescription entityForName:TESTS inManagedObjectContext:context];
    NSManagedObject *cTest = [[NSManagedObject alloc] initWithEntity:entityTest insertIntoManagedObjectContext:context];
    
    [cTest setValue:[test question] forKey:@"question"];
    [cTest setValue:[test rigthAnswer] forKey:@"rightAnswer"];
    
    NSString *answerA = [[test answer] objectAtIndex:0];
    NSString *answerB = [[test answer] objectAtIndex:1];
    NSString *answerC = [[test answer] objectAtIndex:2];
    NSString *answerD = [[test answer] objectAtIndex:3];
    
    [cTest setValue: answerA forKey:@"answerA"];
    [cTest setValue: answerB forKey:@"answerB"];
    [cTest setValue: answerC forKey:@"answerC"];
    [cTest setValue: answerD forKey:@"answerD"];
    
    
    if (![context save:&error]){
        NSLog(@"Nao salvo");
        [context rollback];
    }
    
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

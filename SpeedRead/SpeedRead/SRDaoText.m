//
//  SRDaoText.m
//  SpeedRead
//
//  Created by Rodrigo Soldi Lopes on 06/02/15.
//  Copyright (c) 2015 SpeedRead. All rights reserved.
//

#import "SRDaoText.h"
#import <CoreData/CoreData.h>
#import "SRProperties.h"

@implementation SRDaoText

-(void)create:(SRText *)text
{
    NSError *error;
    NSManagedObjectContext *context = [[SRProperties sharedInstance] managedObjectContext];
    NSEntityDescription *entityText = [NSEntityDescription entityForName:TEXTS inManagedObjectContext:context];
    NSManagedObject *cText = [[NSManagedObject alloc] initWithEntity:entityText insertIntoManagedObjectContext:context];
    
    [cText setValue:[text textAsString] forKey:@"textAsString"];
    [cText setValue: [text title] forKey:@"title"];
    
    if (![context save:&error])
        NSLog(@"Nao Salvo");
    
}

-(SRText *)read:(SRText *)text
{
    return nil;
}

-(void)update:(SRText *)text
{
    
}

-(void)erase:(SRText *)text
{
    
}

@end

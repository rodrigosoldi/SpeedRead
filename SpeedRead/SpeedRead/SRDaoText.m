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
#import "AppDelegate.h"
#import "SRTest.h"

@implementation SRDaoText

-(void)create:(SRText *)text
{
    NSError *error;
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [delegate managedObjectContext];
    SRText *entityText = [NSEntityDescription insertNewObjectForEntityForName: TEXTS inManagedObjectContext: context];
    entityText.textAsString = text.textAsString;
    entityText.title = text.title;
    entityText.tests = text.tests;
    
    if (![context save:&error]){
        NSLog(@"Nao Salvo");
        [context rollback];
    }
    
}

-(SRText *)read:(NSString *)nameText
{
    
    NSManagedObjectContext *context = [[SRProperties sharedInstance] managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Tests" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"title = %@", nameText];
    [request setPredicate: predicate];
    

    NSError *error;
    NSManagedObject *object = [[context executeFetchRequest:request error:&error] mutableCopy];
    
    SRText *text = [SRText new];
    if(object != nil){
        text.title = [object valueForKey:@"title"];
        text.textAsString = [object valueForKey: @"textAsString"];
    }
    
    return text;
}

-(void)update:(SRText *)text
{
    
}

-(void)erase:(SRText *)text
{
    
}

-(NSMutableSet *)list
{
    NSError *error;
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [delegate managedObjectContext];
    
    NSFetchRequest *request = [NSFetchRequest new];
    NSEntityDescription *entity = [NSEntityDescription entityForName:TEXTS inManagedObjectContext:context];
    [request setEntity: entity];
    
    NSArray *objects = [context executeFetchRequest: request error: &error];
    
    NSMutableSet *results = [NSMutableSet new];
    for(SRText *object in objects){
        SRText *text = [[SRText alloc] init];
        text.title = [object valueForKey: @"title"];
        text.textAsString = [object valueForKey:@"textAsString"];
        
        NSArray *test = [object valueForKey:@"tests"];
        NSMutableArray *tests = [NSMutableArray new];
        
        for (SRTest *t in test) {
            SRTest *te = [SRTest new];
            te.question = [t valueForKey:@"question"];
            te.rigthAnswer = [t valueForKey:@"rightAnswer"];
            
            NSString *answer1 = [t valueForKey:@"answerA"];
            NSString *answer2 = [t valueForKey:@"answerB"];
            NSString *answer3 = [t valueForKey:@"answerC"];
            NSString *answer4 = [t valueForKey:@"answerD"];
            
            NSMutableArray *answers = [[NSMutableArray alloc] initWithObjects:answer1, answer2, answer3, answer4, nil];
            
            te.answer = answers;
            
            [tests addObject: te];
        }
        
        
        [results addObject: text];
    }
    
    return results;

}

@end

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

-(void)createWithoutTests:(SRText *)text
{
    NSError *error;
    NSManagedObjectContext *context = [[SRProperties sharedInstance] managedObjectContext];
    NSManagedObject *entityText = [NSEntityDescription insertNewObjectForEntityForName: TEXTS inManagedObjectContext: context];
    
    [entityText setValue: text.textAsString forKey:@"textAsString"];
    [entityText setValue:text.title forKey:@"title"];
    
    if (![context save:&error]){
        NSLog(@"Nao Salvo");
        [context rollback];
    }
    
}

-(void)createWithTests:(SRText *)text
{
    NSError *error;
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [delegate managedObjectContext];
    NSManagedObject *entityText = [NSEntityDescription insertNewObjectForEntityForName: TEXTS inManagedObjectContext: context];
    
    [entityText setValue: text.textAsString forKey:@"textAsString"];
    [entityText setValue:text.title forKey:@"title"];
    
    
    NSMutableSet *mutableSet = [[NSMutableSet alloc] init];
    for (SRTest *test in text.tests) {
        NSManagedObject *objectTest = [NSEntityDescription insertNewObjectForEntityForName:TESTS inManagedObjectContext:context];
        [objectTest setValue: test.question forKey:@"question"];
        [objectTest setValue: test.rigthAnswer forKey:@"rightAnswer"];
        
        //Answer's
        NSString *answerA = [test.answer objectAtIndex:0];
        NSString *answerB = [test.answer objectAtIndex:1];
        NSString *answerC = [test.answer objectAtIndex:2];
        NSString *answerD = [test.answer objectAtIndex:3];
        
        [objectTest setValue: answerA forKey:@"answerA"];
        [objectTest setValue: answerB forKey:@"answerB"];
        [objectTest setValue: answerC forKey:@"answerC"];
        [objectTest setValue: answerD forKey:@"answerD"];
        
        [objectTest setValue: entityText forKey:@"text"];
        
        [mutableSet addObject: objectTest];
        
    }
    
    [entityText setValue:mutableSet forKeyPath:@"tests"];
    
    if (![context save:&error]){
        NSLog(@"Nao Salvo");
        [context rollback];
    }
}

-(SRText *)read:(NSString *)nameText
{
    
    NSManagedObjectContext *context = [[SRProperties sharedInstance] managedObjectContext];
    NSEntityDescription *entityText = [NSEntityDescription entityForName:TEXTS inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityText];
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"title = %@", nameText];
    [request setPredicate: predicate];
    

    NSError *error;
    NSArray *object = [context executeFetchRequest:request error:&error];
    
    SRText *text = [SRText new];
    for (NSManagedObject *objectText in object) {
        text.title = [objectText valueForKey:@"title"];
        text.textAsString = [objectText valueForKey:@"textAsString"];
        
        NSArray *tests = [objectText valueForKey:@"tests"];
        text.tests = [[NSMutableSet alloc] init];
        
        for (NSManagedObject *objectTest in tests) {
            SRTest *test = [SRTest new];
            test.question = [objectTest valueForKey:@"question"];
            test.rigthAnswer = [objectTest valueForKey:@"rightAnswer"];

            NSMutableArray *answers = [[NSMutableArray alloc] initWithCapacity:4];
            @try {
                [answers addObject: [objectTest valueForKey:@"answerA"]];
                [answers addObject: [objectTest valueForKey:@"answerB"]];
                [answers addObject: [objectTest valueForKey:@"answerC"]];
                [answers addObject: [objectTest valueForKey:@"answerD"]];
            }
            @catch (NSException *exception) {}
            
            test.answer = answers;
            
            [text.tests addObject: test];
        }
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
    
    NSMutableSet *resultados = [[NSMutableSet alloc] init];
    SRText *text = [SRText new];
    for (NSManagedObject *objectText in objects) {
        text.title = [objectText valueForKey:@"title"];
        text.textAsString = [objectText valueForKey:@"textAsString"];
        
        NSArray *tests = [objectText valueForKey:@"tests"];
        text.tests = [[NSMutableSet alloc] init];
        
        for (NSManagedObject *objectTest in tests) {
            SRTest *test = [SRTest new];
            test.question = [objectTest valueForKey:@"question"];
            test.rigthAnswer = [objectTest valueForKey:@"rightAnswer"];
            
            NSMutableArray *answers = [[NSMutableArray alloc] initWithCapacity:4];
            @try {
                [answers addObject: [objectTest valueForKey:@"answerA"]];
                [answers addObject: [objectTest valueForKey:@"answerB"]];
                [answers addObject: [objectTest valueForKey:@"answerC"]];
                [answers addObject: [objectTest valueForKey:@"answerD"]];
            }
            @catch (NSException *exception) {}
            
            test.answer = answers;
            
            [text.tests addObject: test];
        }
        [resultados addObject: text];
    }        
    
    return resultados;

}

@end

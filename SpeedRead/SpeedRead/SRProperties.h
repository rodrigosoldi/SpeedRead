//
//  SRProperties.h
//  SpeedRead
//
//  Created by Rodrigo Soldi Lopes on 06/02/15.
//  Copyright (c) 2015 SpeedRead. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#define TESTS @"Tests"
#define TEXTS @"Texts"

@interface SRProperties : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+(SRProperties *) sharedInstance;

-(NSManagedObjectContext *) managedObjectContext;
-(NSManagedObjectModel *) managedObjectModel;
-(NSPersistentStoreCoordinator *) persistentStoreCoordinator;

@end

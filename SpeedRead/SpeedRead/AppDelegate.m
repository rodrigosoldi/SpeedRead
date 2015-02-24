//
//  AppDelegate.m
//  SpeedRead
//
//  Created by Rodrigo Soldi Lopes on 06/02/15.
//  Copyright (c) 2015 SpeedRead. All rights reserved.
//

#import "AppDelegate.h"
#import "SRText.h"
#import "SRProperties.h"
#import "SRTest.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.    
    
//    SRText *t1 = [SRText new];
//    
//    [t1 setTitle:@"Charles Joseph Messier"];
//    [t1 setTextAsString:@"Charles Joseph Messier (Badonviller, 26 de junho de 1730 – Paris, 12 de abril de 1817) foi um astrônomo francês, conhecido pela compilação e publicação, com a coautoria de Pierre Méchain, de seu catálogo de objetos de céu profundo, uma lista de 110 objetos astronômicos como nebulosas, aglomerados estelares e galáxias que vieram a ser conhecidos como os \"objetos Messier\".1 Pretendia, com a publicação do catálogo, auxiliar a si mesmo e outros astrônomos e observadores em sua atividade astronômica principal durante sua carreira, a investigação de cometas, listando todos objetos que pôde identificar e que poderiam ser facilmente confundidos com cometas transientes, mas que, na realidade, tinham naturezas completamente diferentes e eram fixos no céu noturno. Contudo, Messier, sem intenção, catalogou alguns dos astros mais interessantes para a atual astronomia amadora.2 Tornou-se um observador do céu ao trabalhar para Joseph-Nicolas Delisle em seu observatório em Paris, aos 21 anos. Foi o primeiro astrônomo a dedicar-se quase exclusivamente à procura de cometas e, enquanto aguardava o retorno do cometa Halley, deparou-se com um falso positivo ao confundir uma nebulosa com o cometa. Para evitar novos enganos, começou a compilar os objetos fixos no céu profundo que poderiam ser facilmente confundidos com um cometa, objeto difuso e de fraco brilho. De 1758 a 1782, com a ajuda de Pierre Méchain após 1774, compilou 107 objetos entre nebulosas, aglomerados estelares e galáxias.nota 1 Três objetos adicionais foram mais tarde adicionados ao catálogo, após a morte de Messier, completando 110 objetos ao todo.Contudo, foi bem-sucedido em sua principal atividade astronômica, a descoberta e acompanhamento de cometas, Descobriu vinte ao todo,3 treze descobertos originalmente por ele e outras 7 codescobertas independentes. Também foi membro de várias academias científicas espalhadas pela Europa, sendo membro estrangeiro da Royal Society e membro efetivo da Académie des sciences.1 Em 1806, recebeu de Napoleão Bonaparte a Ordem Nacional da Legião de Honra4 e dedicou ao imperador francês o Grande Cometa de 1769, considerado \"o último cometa astrologicamente apresentado ao público por um astrônomo ortodoxo\"."];
//    
//    
//    [t1 createWithoutTests];
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "SpeedRead.SpeedRead" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"SpeedRead" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"SpeedRead.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end

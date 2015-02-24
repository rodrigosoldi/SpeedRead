//
//  SRText.h
//  SpeedRead
//
//  Created by Rodrigo Soldi Lopes on 06/02/15.
//  Copyright (c) 2015 SpeedRead. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface SRText : NSManagedObject

@property NSString *textAsString;
@property NSArray *textAsArray;
@property NSString *title;
@property NSSet *tests;

-(void)save;
-(SRText *)text: (NSString *)title;
+(NSSet *)list;

@end

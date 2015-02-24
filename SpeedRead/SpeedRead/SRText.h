//
//  SRText.h
//  SpeedRead
//
//  Created by Rodrigo Soldi Lopes on 06/02/15.
//  Copyright (c) 2015 SpeedRead. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRText : NSObject

@property NSString *textAsString;
@property NSArray *textAsArray;
@property NSString *title;
@property NSMutableSet *tests;

#pragma mark - Core Data Methods

/*! 
 This method creates a new SRText in Database without the SRTest.
 
 */
-(void)createWithoutTests;


/*!
  This method creates a new SRText in Database with all SRTest
 */
-(void)createWithTests;

+(SRText *)text: (NSString *)title;

+(NSSet *)list;

@end

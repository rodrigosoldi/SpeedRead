//
//  SRTest.h
//  SpeedRead
//
//  Created by Rodrigo Soldi Lopes on 06/02/15.
//  Copyright (c) 2015 SpeedRead. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRTest : NSObject

@property NSString *question;
@property NSMutableArray *answer;
@property NSString *rigthAnswer;
@property NSString *givenAnswer;

-(BOOL)evaluate;

@end
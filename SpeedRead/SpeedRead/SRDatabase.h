//
//  SRDatabase.h
//  SpeedRead
//
//  Created by Rodrigo Soldi Lopes on 06/02/15.
//  Copyright (c) 2015 SpeedRead. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRDatabase : NSObject

+(SRDatabase *)sharedInstance;

-(void)create: (NSObject *)object;
-(void)update: (NSObject *)object;
-(void)erase: (NSObject *)object;
-(NSObject *)read: (NSObject *)object;

@end

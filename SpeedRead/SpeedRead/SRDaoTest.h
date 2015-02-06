//
//  SRDaoTest.h
//  SpeedRead
//
//  Created by Rodrigo Soldi Lopes on 06/02/15.
//  Copyright (c) 2015 SpeedRead. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "SRTest.h"

@interface SRDaoTest : NSObject

-(void)create:(SRTest *)test;
-(SRTest *)read: (SRTest *)test;
-(void)update: (SRTest *)test;
-(void)erase: (SRTest *)test;

@end

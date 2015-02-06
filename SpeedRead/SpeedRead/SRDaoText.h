//
//  SRDaoText.h
//  SpeedRead
//
//  Created by Rodrigo Soldi Lopes on 06/02/15.
//  Copyright (c) 2015 SpeedRead. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SRText.h"

@interface SRDaoText : NSObject

-(void)create:(SRText *)text;
-(SRText *)read: (SRText *)text;
-(void)update: (SRText *)text;
-(void)erase: (SRText *)text;

@end
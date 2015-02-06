//
//  SRSession.h
//  SpeedRead
//
//  Created by Rodrigo Soldi Lopes on 06/02/15.
//  Copyright (c) 2015 SpeedRead. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRSession : NSObject

@property NSDate *sessionDate;
@property float totalTime;

- (void)startSession;
- (void)finishSession;

@end

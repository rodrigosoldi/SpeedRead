//
//  SRSession.h
//  SpeedRead
//
//  Created by Rodrigo Soldi Lopes on 06/02/15.
//  Copyright (c) 2015 SpeedRead. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SRText;

@interface SRSession : NSObject

@property SRText *text;
@property NSDate *sessionDate;
@property float totalTime;
@property NSString *currentWords;
@property float speed;

- (void)startSession;
- (void)finishSession;
- (void)refresh:(NSTimer *)timer;

@end

//
//  SRSession.m
//  SpeedRead
//
//  Created by Rodrigo Soldi Lopes on 06/02/15.
//  Copyright (c) 2015 SpeedRead. All rights reserved.
//

#import "SRSession.h"
#import "SRText.h"

@implementation SRSession

- (void)startSession {
    [NSTimer scheduledTimerWithTimeInterval:_speed target:self selector:@selector(refresh:) userInfo:nil repeats:YES];
}

- (void)refresh:(NSTimer *)timer {
    NSArray *array = _text.textAsArray;
    NSInteger static count=0;
    
    if(count != array.count)
    {
        _currentWords = array[count++];
    }
    else {
        [timer invalidate];
    }
}

@end

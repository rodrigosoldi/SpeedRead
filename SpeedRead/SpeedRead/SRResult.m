//
//  SRResult.m
//  SpeedRead
//
//  Created by Rodrigo Soldi Lopes on 06/02/15.
//  Copyright (c) 2015 SpeedRead. All rights reserved.
//

#import "SRResult.h"

@implementation SRResult

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _answeredQuestions = [[NSMutableArray alloc]init];
        _correctAnswersRate = -1;
    }
    
    return self;
}

@end

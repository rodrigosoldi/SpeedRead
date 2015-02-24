//
//  SRText.m
//  SpeedRead
//
//  Created by Rodrigo Soldi Lopes on 06/02/15.
//  Copyright (c) 2015 SpeedRead. All rights reserved.
//

#import "SRText.h"
#import "SRDaoText.h"

@implementation SRText


- (NSArray *)textAsArray {
    return [_textAsString componentsSeparatedByString:@" "];
}

@end

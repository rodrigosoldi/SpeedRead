//
//  SRDatabase.m
//  SpeedRead
//
//  Created by Rodrigo Soldi Lopes on 06/02/15.
//  Copyright (c) 2015 SpeedRead. All rights reserved.
//

#import "SRDatabase.h"

@implementation SRDatabase

- (SRDatabase *)init {
    self = [super init];
    if (self) {}
    return self;
}

+ (SRDatabase *)sharedInstance {
    static SRDatabase *instance;
    if (!instance)
        instance = [[self alloc] init];
    
    return instance;
}

-(void)create:(NSObject *)object
{
    
}

-(NSObject *)read:(NSObject *)object
{
    return nil;
}

-(void)erase:(NSObject *)object
{
    
}

-(void)update:(NSObject *)object
{
    
}

@end

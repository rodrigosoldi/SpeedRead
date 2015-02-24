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

SRDaoText *daoText;

- (NSArray *)textAsArray {
    return [_textAsString componentsSeparatedByString:@" "];
}

-(void)createWithTests
{
    daoText = [SRDaoText new];
    [daoText createWithTests: self];
}

-(void)createWithoutTests
{
    daoText = [SRDaoText new];
    [daoText createWithoutTests: self];
}

+(SRText *)text:(NSString *)title
{
    daoText = [SRDaoText new];
    return [daoText read: title];
}

+(NSSet *)list
{
    daoText = [SRDaoText new];
    return [daoText list];
}

@end

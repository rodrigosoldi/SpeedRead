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

-(void)createWithoutTests
{
    SRDaoText *daoText = [[SRDaoText alloc] init];
    [daoText createWithoutTests: self];
}

-(void)createWithTests
{
    SRDaoText *daoText = [[SRDaoText alloc] init];
    [daoText createWithTests: self];
}

+(SRText *)text:(NSString *)title
{
    SRDaoText *daoText = [[SRDaoText alloc] init];
    return [daoText read: title];
}

+(NSSet *)list
{
    SRDaoText *daoText = [[SRDaoText alloc] init];
    return [daoText list];
}

@end

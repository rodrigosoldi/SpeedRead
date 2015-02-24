//
//  SRText.h
//  SpeedRead
//
//  Created by Rodrigo Soldi Lopes on 06/02/15.
//  Copyright (c) 2015 SpeedRead. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRText : NSObject

@property NSString *textAsString;
@property (readonly) NSArray *textAsArray;
@property NSString *title;
@property NSOrderedSet *tests;

-(void)save;
-(SRText *)text: (NSString *)title;
+(NSSet *)list;

@end

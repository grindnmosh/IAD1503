//
//  GoldScoreObject.m
//  KingdomsFall
//
//  Created by Robert Warren on 3/17/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "GoldScoreObject.h"

@implementation GoldScoreObject
@synthesize goldPiles, initials, gameGold;

-(id)initWithGold:(NSString*)player gold:(NSString*)gold
{
    if (self = [super init])
    {
        initials = player;
        gameGold = gold;
    }
    return self;
}

static GoldScoreObject * _sharedGoldArray = nil;
+(GoldScoreObject*)sharedGoldArray
{
    if (!_sharedGoldArray)
    {
        _sharedGoldArray = [[self alloc] init];
    }
    return _sharedGoldArray;
}

//database
-(id)init
{
    if ((self = [super init]))
    {
        goldPiles = [[NSMutableArray alloc] init];
    }
    return self;
}
@end

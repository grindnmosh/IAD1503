//
//  SavingGoldScore.m
//  KingdomsFall
//
//  Created by Robert Warren on 3/17/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "SavingGoldScore.h"

@implementation SavingGoldScore
{
    SavingGoldScore *gameComplete;
}

@synthesize initials, gameGold;

+(SavingGoldScore *) singleObj
{
    static SavingGoldScore *sing = nil;
    @synchronized(self)
    {
        if (!sing)
        {
            sing = [[SavingGoldScore alloc] init];
        }
        return sing;
    }
}

@end

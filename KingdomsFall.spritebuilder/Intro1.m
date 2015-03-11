//
//  Intro1.m
//  KingdomsFall
//
//  Created by Robert Warren on 3/10/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Intro1.h"

@implementation Intro1
- (void)didLoadFromCCB {
    [self schedule:@selector(loadNew:) interval:5];
}

/// Intro flow
-(void)loadNew:(CCTime)delta
{
    [[CCDirector sharedDirector] replaceScene:[CCBReader loadAsScene:@"Intro2"]];
}

@end

//
//  Intro4.m
//  KingdomsFall
//
//  Created by Robert Warren on 3/10/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Intro4.h"

@implementation Intro4
- (void)didLoadFromCCB {
    [self schedule:@selector(loadNew:) interval:5];
}

/// Intro flow
-(void)loadNew:(CCTime)delta
{
    [[CCDirector sharedDirector] replaceScene:[CCBReader loadAsScene:@"StartPoint"]];
}

@end

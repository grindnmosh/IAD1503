//
//  BossIntro.m
//  KingdomsFall
//
//  Created by Robert Warren on 3/10/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "BossIntro.h"

@implementation BossIntro
- (void)didLoadFromCCB {
    [self schedule:@selector(loadNew:) interval:5];
}

// Cutscene transition
-(void)loadNew:(CCTime)delta
{
    [[CCDirector sharedDirector] replaceScene:[CCBReader loadAsScene:@"BossFight"]];
}
@end

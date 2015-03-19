//
//  LocalLeader.m
//  KingdomsFall
//
//  Created by Robert Warren on 3/17/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "LocalLeader.h"
#import "GoldScoreObject.h"
#import "GCSupport.h"

@implementation LocalLeader
- (void)didLoadFromCCB
{
    singleGold = [SavingGoldScore singleObj];
    NSMutableArray *player = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"player"] mutableCopy];
    NSMutableArray *gold = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"gold"] mutableCopy];
    for (int i = 0; i < [player count]; i++)
    {
        initials = [player objectAtIndex:i];
        gameGold = [gold objectAtIndex:i];
        GoldScoreObject *load = [[GoldScoreObject alloc] initWithGold:initials gold:gameGold];
        GoldScoreObject *database = [GoldScoreObject sharedGoldArray];
        NSMutableArray *list = database.goldPiles;
        if (list != nil) {
            [list addObject:load];
        }
        listArray= [GoldScoreObject sharedGoldArray];
        
        for (int i=0; i < [listArray.goldPiles count]; i++)
        {
            tableCell = [CCNode node];
            scoreLabel = [CCLabelTTF node];
            NSString *pName = [[listArray.goldPiles objectAtIndex:i] initials];
            NSString *gold = [[listArray.goldPiles objectAtIndex:i] gameGold];
            NSString *label = [NSString stringWithFormat: @"Player: %@ --- Gold: %@", pName, gold];
            scoreLabel.position = ccp(120.0f, i * -15.0f);
            [scoreLabel setString:label];
            [tableCell addChild:scoreLabel];
            tableCell.contentSize = CGSizeMake( 600.0f, 0.0f);
            tableCell.position = ccp(0.0f, 0.0f);
            tableCell.userInteractionEnabled = YES;
        }
        
        
        CCScrollView *scroll = [CCScrollView node];
        scroll.contentNode = tableCell;
        scroll.position = ccp(30.0f, 0.0f);
        scroll.anchorPoint = ccp(0.0f, 0.0f);
        scroll.verticalScrollEnabled = YES;
        scroll.scaleX = 1.0f;
        scroll.scaleY = 1.0f;
        [self addChild:scroll];
    }
}

- (void)backToMenu:(id)sender
{
    [[CCDirector sharedDirector] replaceScene:[CCBReader loadAsScene:@"MainScene"]];
}


@end

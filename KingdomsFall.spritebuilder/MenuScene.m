//
//  MenuScene.m
//  KingdomsFall
//
//  Created by Robert Warren on 2/17/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "MenuScene.h"
#import "MarchBegins.h"
#import "GoldScoreObject.h"
#import "GCSupport.h"

@implementation MenuScene

- (void)didLoadFromCCB {
    //code for testing
    [GKAchievement resetAchievementsWithCompletionHandler:^(NSError *error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
    //Code for testing end
    
    //BG Music
    [[OALSimpleAudio sharedInstance] preloadBg:@"Alters.caf"];
    [[OALSimpleAudio sharedInstance] playBg:@"Alters.caf" loop:YES];
    
    //enable touch
    self.userInteractionEnabled = TRUE;
    
    NSMutableArray *player = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"player"] mutableCopy];
    NSMutableArray *gold = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"gold"] mutableCopy];
    for (int i = 0; i < [player count]; i++)
    {
        NSString *initials = [player objectAtIndex:i];
        NSString *gameGold = [gold objectAtIndex:i];
        GoldScoreObject *load = [[GoldScoreObject alloc] initWithGold:initials gold:gameGold];
        GoldScoreObject *database = [GoldScoreObject sharedGoldArray];
        NSMutableArray *list = database.goldPiles;
        if (list != nil) {
            [list addObject:load];
        }
        listArray = [GoldScoreObject sharedGoldArray];
    }
    
}

- (id) init
{
    if (self = [super init]){
        
    }
    return self;
}

- (void)startGame:(id)sender
{
    [[CCDirector sharedDirector] replaceScene:[CCBReader loadAsScene:@"Intro1"]];
}

- (void)instructions:(id)sender
{
    [[CCDirector sharedDirector] replaceScene:[CCBReader loadAsScene:@"Instructions"]];
}

- (void)gameCredits:(id)sender
{
    [[CCDirector sharedDirector] replaceScene:[CCBReader loadAsScene:@"GameCredits"]];
}




@end

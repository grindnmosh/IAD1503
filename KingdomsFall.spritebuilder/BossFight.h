//
//  BossFight.h
//  KingdomsFall
//
//  Created by Robert Warren on 3/10/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "CCScene.h"

@interface BossFight : CCScene
{
    CCNode *_knight;
    CCNode *_bossBubble;
    CCNode *_bossText;
    CCSprite *_reaper;
    int knightHP;
    CGSize width;
    CCLabelTTF *_goldLabel;
    NSMutableArray* _spritesArray;
    NSInteger goldAmount;
}

@end

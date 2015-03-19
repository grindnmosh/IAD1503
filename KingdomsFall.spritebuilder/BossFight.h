//
//  BossFight.h
//  KingdomsFall
//
//  Created by Robert Warren on 3/10/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "CCScene.h"
#import "GoldScoreObject.h"
#import "SavingGoldScore.h"
#import "GCSupport.h"

@interface BossFight : CCScene
{
    GoldScoreObject *listArray;
    CCNode *_knight;
    CCNode *_bossBubble;
    CCNode *_bossText;
    CCSprite *_reaper;
    int knightHP;
    CGSize width;
    CCLabelTTF *_goldLabel;
    NSMutableArray* _spritesArray;
    NSInteger goldAmount;
    NSInteger goldAmountFinal;
    CCLabelTTF *_winner;
    CCButton *_menuButton;
    CCLabelTTF *_gameOver;
    CCLabelTTF *_initials;
    CCButton *_subButt;
    CCButton *_highScore;
    NSMutableArray *continuos1;
    NSMutableArray *continuos2;
}

@end

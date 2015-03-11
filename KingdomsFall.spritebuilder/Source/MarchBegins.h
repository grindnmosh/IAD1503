//
//  MarchBegins.h
//  KingdomsFall
//
//  Created by Robert Warren on 2/3/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "CCScene.h"
#import "GameHud.h"

@interface MarchBegins : CCScene
{
    CCNode *_pauseResume;
    CCNode* _physicsNode;
    CCNode* _ground1;
    CCNode* _ground2;
    CCNode* _ground3;
    CCNode* _ground4;
    CCNode* _ground5;
    CCNode* _castlebg;
    CCSprite* _knight;
    CCNode* _death1;
    CCNode* _death2;
    CCNode* _gainGold;
    CCSprite* _wiz;
    CCSprite* _darkSpirit;
    CCSprite* _gold;
    CCSprite* _boulder;
    NSArray* _grounds;
    NSMutableArray* _spritesArray;
    NSTimeInterval _sinceTouch;
    int currGold;
    int newGold;
    int knightHP;
    CGSize width;
    CCLabelTTF *_goldLabel;
    NSInteger goldAmount;
    CCLabelTTF *_winner;
    CCButton *_menuButton;
    CCLabelTTF *_gameOver;
}


@end

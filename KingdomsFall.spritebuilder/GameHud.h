//
//  GameHud.h
//  KingdomsFall
//
//  Created by Robert Warren on 2/11/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "CCScene.h"
#import "MarchBegins.h"

@interface GameHud : CCScene
{
    CCNode *_GH;
    CCNode *_pauseGame;
    CCNode *_resumePlay;
    NSInteger goldAmount;
    CCLabelTTF *_goldCount;
    CCLabelTTF *_gamePausedLabel;
}

@end

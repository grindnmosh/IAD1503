//
//  LocalLeader.h
//  KingdomsFall
//
//  Created by Robert Warren on 3/17/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "CCScene.h"
#import "SavingGoldScore.h"
#import "GoldScoreObject.h"

@interface LocalLeader : CCScene
{
    SavingGoldScore *singleGold;
    GoldScoreObject *listArray;
    CCScrollView *_scoreContainer;
    NSString *initials;
    NSString *gameGold;
    CCLabelTTF *scoreLabel;
    CCNode *tableCell;
}
@end

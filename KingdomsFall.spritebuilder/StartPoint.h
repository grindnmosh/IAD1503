//
//  StartPoint.h
//  KingdomsFall
//
//  Created by Robert Warren on 3/10/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "CCScene.h"

@interface StartPoint : CCScene
{
    CCSprite *_knight;
    CGSize width;
    CCNode *_story1Open;
    CCNode *_story1Closed;
    CCNode *_story1Text;
    CCNode *_story2Open;
    CCNode *_story2Closed;
    CCNode *_story2Text;
    CCNode *_bg;
    CCButton *_x1;
    CCButton *_x2;
    CCButton *_dot1;
    CCButton *_dot2;
    BOOL talked;
}
@end

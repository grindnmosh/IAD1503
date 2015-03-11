//
//  StartPoint.m
//  KingdomsFall
//
//  Created by Robert Warren on 3/10/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "StartPoint.h"

@implementation StartPoint
- (void)didLoadFromCCB {
    self.userInteractionEnabled = TRUE;
    width = [[CCDirector sharedDirector] viewSize];
    _story1Open.userInteractionEnabled = TRUE;
    _story1Closed.userInteractionEnabled = TRUE;
    _story1Open.visible = FALSE;
    _story1Closed.visible = TRUE;
    _story1Text.visible = FALSE;
    _dot1.visible = TRUE;
    _x1.visible = FALSE;
    _story2Open.visible = FALSE;
    _story2Closed.visible = TRUE;
    _story2Text.visible = FALSE;
    _dot2.visible = TRUE;
    _x2.visible = FALSE;
}


- (void)touchBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //move knight
    _knight.position = ccp(_knight.position.x, _knight.position.y);
    
    
    CCActionMoveBy *moveNodeRight = [CCActionMoveBy actionWithDuration:1.0f position:ccp(40.0f, 0.0f)];
    [_knight runAction:moveNodeRight];
    if (_knight.position.x  >= width.width)
    {
        [[CCDirector sharedDirector] replaceScene:[CCBReader loadAsScene:@"MarchBegins"]];
    }
}

- (void)openStory1:(id)sender
{
    _story1Open.visible = TRUE;
    _story1Closed.visible = FALSE;
    _story1Text.visible = TRUE;
    _dot1.visible = FALSE;
    _x1.visible = TRUE;
}

- (void)closeStory1:(id)sender
{
    _story1Open.visible = FALSE;
    _story1Closed.visible = TRUE;
    _story1Text.visible = FALSE;
    _dot1.visible = TRUE;
    _x1.visible = FALSE;
}

- (void)openStory2:(id)sender
{
    _story2Open.visible = TRUE;
    _story2Closed.visible = FALSE;
    _story2Text.visible = TRUE;
    _dot2.visible = FALSE;
    _x2.visible = TRUE;
}

- (void)closeStory2:(id)sender
{
    _story2Open.visible = FALSE;
    _story2Closed.visible = TRUE;
    _story2Text.visible = FALSE;
    _dot2.visible = TRUE;
    _x2.visible = FALSE;
}
@end

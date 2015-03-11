//
//  BossFight.m
//  KingdomsFall
//
//  Created by Robert Warren on 3/10/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "BossFight.h"

@implementation BossFight
- (void)didLoadFromCCB {
    _spritesArray = [NSMutableArray arrayWithObjects:_reaper, nil];
    self.userInteractionEnabled = TRUE;
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"anim-knight.plist"];
    NSMutableArray *animateKnight = [NSMutableArray array];
    for (int i = 1; i <= 5; ++i) {
        [animateKnight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"hero%d.png", i]]];
    }
    CCAnimation *animate = [CCAnimation animationWithSpriteFrames:animateKnight delay:0.1f];
    NSLog(@"%f, %f", _knight.position.x, _knight.position.y);
    _knight.position = ccp(-27.0f, 92.83f);
    [_knight setScaleX:0.3f];
    [_knight setScaleY:0.6f];
    _knight.anchorPoint = ccp(0,0);
    CCActionAnimate *getAnimated = [CCActionAnimate actionWithAnimation:animate];
    CCActionRepeatForever *knightForever = [CCActionRepeatForever actionWithAction:getAnimated];
    [_knight runAction:knightForever];
    _knight.position = ccp(-27.0f, 92.83f);
    width = [[CCDirector sharedDirector] viewSize];
    NSLog(@"%f", width.width);
    [self schedule:@selector(bossFade:) interval:5];
    goldAmount = 10626;
    knightHP = 500;
    [_goldLabel setString:[NSString stringWithFormat:@"%ld", (long)goldAmount]];
    
    
}

//NPC Chat Bubbles for Boss threats
-(void)bossFade:(CCTime)delta
{
    CCActionFadeOut *fadeOut = [CCActionFadeOut actionWithDuration:2.0f];
    CCActionHide *hide = [CCActionHide action];
    CCActionSequence *die = [CCActionSequence actions:fadeOut, hide, nil];
    [_bossText runAction:die];
    _bossBubble.visible = FALSE;
}

- (void)update:(CCTime)delta {
  
    //collision check
    CCSprite *sprite = [self spriteCollisionWithRect:_knight.boundingBox];
    if (sprite!=nil) {
        
    }

    
}

//Collision Code
-(CCSprite*)spriteCollisionWithRect:(CGRect)bounds
{
    for (CCSprite *sprite in _spritesArray) {
        if (CGRectIntersectsRect(sprite.boundingBox, bounds)) {
            if (sprite == _reaper)
            {
                [[OALSimpleAudio sharedInstance] preloadEffect:@"Mace_Hit.caf"];
                [[OALSimpleAudio sharedInstance] playEffect:@"Mace_Hit.caf" loop:NO];
                [sprite removeFromParentAndCleanup:YES];
                [_spritesArray removeObject:sprite];
                CCActionShow *show = [CCActionShow action];
                CCActionFadeOut *fadeOut = [CCActionFadeOut actionWithDuration:2.0f];
                CCActionHide *hide = [CCActionHide action];
                CCActionSequence *die = [CCActionSequence actions:show, fadeOut, hide, nil];
                [_reaper runAction:die];
            }
            
            
            return sprite;
        }
    }
    return nil;
}

//Movement
- (void)touchBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //move knight
    _knight.position = ccp(_knight.position.x, _knight.position.y);
    
    
    CCActionMoveBy *moveNodeRight = [CCActionMoveBy actionWithDuration:1.0f position:ccp(40.0f, 0.0f)];
    [_knight runAction:moveNodeRight];
    if (_knight.position.x  >= width.width)
    {
        //[[CCDirector sharedDirector] replaceScene:[CCBReader loadAsScene:@"MarchBegins"]];
    }
}

@end

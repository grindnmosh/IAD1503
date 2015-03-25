//
//  MarchBegins.m
//  KingdomsFall
//
//  Created by Robert Warren on 2/3/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "MarchBegins.h"
#import "GameHud.h"
#import <AVFoundation/AVFoundation.h>
#import "GCSupport.h"

//static const CGFloat scrollSpeed = 80.f;

@implementation MarchBegins
//All initial calls including background music
- (void)didLoadFromCCB {
    _grounds = @[_ground1, _ground2, _ground3, _ground4, _ground5];
    //sprites array for determining which was collided with and which sound effect to play.
    _spritesArray = [NSMutableArray arrayWithObjects:_wiz, _darkSpirit, _gold, _boulder, nil];
    //enable touch
    self.userInteractionEnabled = TRUE;
    _death1.visible = false;
    _death2.visible = false;
    _gainGold.visible =false;

    //GH = [[GameHud alloc] init];
    goldAmount = 9626;
    knightHP = 500;
    [_goldLabel setString:[NSString stringWithFormat:@"%ld", (long)goldAmount]];
    [self newGame];
}


-(void)newGame
{
    //ANIMATION of my knight
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
    //background music
    [[OALSimpleAudio sharedInstance] preloadBg:@"Alters.caf"];
    [[OALSimpleAudio sharedInstance] playBg:@"Alters.caf" loop:YES];
    //ground array for scrolling background
}

- (id)init
{
    if (self = [super init])
    {
       
        
        
        
        
        
        
        
        
    }
    return self;
}




//sounds from week 1
-(void)playSound:(id)sender
{
    
    if (sender == _knight) {
       [[OALSimpleAudio sharedInstance] playEffect:@"Realistic_Punch.caf" loop:NO];
    }
    else if (sender == _gold)
    {
        [[OALSimpleAudio sharedInstance] playEffect:@"gold.caf" loop:NO];
    }
    else if (sender == _darkSpirit)
    {
        [[OALSimpleAudio sharedInstance] playEffect:@"Mace_Hit.caf" loop:NO];
    }
    else if (sender == _wiz)
    {
        [[OALSimpleAudio sharedInstance] playEffect:@"Mace_Hit.caf" loop:NO];
    }
}



//constant run method. scrolling background full works when run but constant. looking for way to run it only when knight moves. also runs collision check.




//collision check method
-(CCSprite*)spriteCollisionWithRect:(CGRect)bounds
{
    for (CCSprite *sprite in _spritesArray) {
        if (CGRectIntersectsRect(sprite.boundingBox, bounds)) {
            if (sprite == _gold)
            {
                [[OALSimpleAudio sharedInstance] preloadEffect:@"gold.caf"];
                [[OALSimpleAudio sharedInstance] playEffect:@"gold.caf" loop:NO];
                [sprite removeFromParentAndCleanup:YES];
                [_spritesArray removeObject:sprite];
                goldAmount = goldAmount+1000;
                NSLog(@"Gold:%ld", (long)goldAmount);
                [_goldLabel setString:[NSString stringWithFormat:@"%ld", (long)goldAmount]];
                CCActionShow *show = [CCActionShow action];
                CCActionFadeOut *fadeOut = [CCActionFadeOut actionWithDuration:2.0f];
                CCActionHide *hide = [CCActionHide action];
                CCActionSequence *die = [CCActionSequence actions:show, fadeOut, hide, nil];
                [_gainGold runAction:die];
                
                NSString *achievementIdentifier = @"KF2000FK";
                NSString *level1Id = @"KF111FK";
                
                
                GKAchievement *gold2k = [[GKAchievement alloc] initWithIdentifier:achievementIdentifier];
                GKAchievement *level1 = [[GKAchievement alloc] initWithIdentifier:level1Id];
                
                
                
                gold2k.percentComplete = 100;
                level1.percentComplete = 33;
                
                NSArray *achieved = @[gold2k, level1];
                [GKAchievement reportAchievements:achieved withCompletionHandler:^(NSError *error) {
                    if (error != nil) {
                        NSLog(@"%@", [error localizedDescription]);
                    }
                }];

                gold2k.showsCompletionBanner = YES;
                level1.showsCompletionBanner = YES;
            }
            else if (sprite == _darkSpirit)
            {
                [[OALSimpleAudio sharedInstance] preloadEffect:@"Mace_Hit.caf"];
                [[OALSimpleAudio sharedInstance] playEffect:@"Mace_Hit.caf" loop:NO];
                [sprite removeFromParentAndCleanup:YES];
                [_spritesArray removeObject:sprite];
                CCActionShow *show = [CCActionShow action];
                CCActionFadeOut *fadeOut = [CCActionFadeOut actionWithDuration:2.0f];
                CCActionHide *hide = [CCActionHide action];
                CCActionSequence *die = [CCActionSequence actions:show, fadeOut, hide, nil];
                
                NSString *achievementIdentifier = @"KF2downFK";
                NSString *level1Id = @"KF111FK";
                
                GKAchievement *allClear = [[GKAchievement alloc] initWithIdentifier:achievementIdentifier];
                GKAchievement *level1 = [[GKAchievement alloc] initWithIdentifier:level1Id];
                
                allClear.percentComplete = 100;
                level1.percentComplete = 66;
                
                NSArray *achieved = @[allClear, level1];
                [GKAchievement reportAchievements:achieved withCompletionHandler:^(NSError *error) {
                    if (error != nil) {
                        NSLog(@"%@", [error localizedDescription]);
                    }
                }];
                
                allClear.showsCompletionBanner = YES;
                level1.showsCompletionBanner = YES;
                
                [_death2 runAction:die];
            }
            else if (sprite == _wiz)
            {
                [[OALSimpleAudio sharedInstance] preloadEffect:@"Mace_Hit.caf"];
                [[OALSimpleAudio sharedInstance] playEffect:@"Mace_Hit.caf" loop:NO];
                [sprite removeFromParentAndCleanup:YES];
                [_spritesArray removeObject:sprite];
                
                CCActionShow *show = [CCActionShow action];
                CCActionFadeOut *fadeOut = [CCActionFadeOut actionWithDuration:2.0f];
                CCActionHide *hide = [CCActionHide action];
                CCActionSequence *die = [CCActionSequence actions:show, fadeOut, hide, nil];
                [_death1 runAction:die];
            }
            else if (sprite == _boulder)
            {
                _knight.position = ccp(_knight.position.x, _knight.position.y);
                CCActionMoveBy *moveNodeUpNOver = [CCActionMoveBy actionWithDuration:1.0f position:ccp(60.0f, 60.0f)];
                [_knight runAction:moveNodeUpNOver];
                [_spritesArray removeObject:sprite];
                [[OALSimpleAudio sharedInstance] preloadEffect:@"jump.caf"];
                [[OALSimpleAudio sharedInstance] playEffect:@"jump.caf" loop:NO];
            }
            
            return sprite;
        }
    }
    return nil;
}

- (void)update:(CCTime)delta {
    
    //scrolling background
    /*_physicsNode.position = ccp(_physicsNode.position.x - (scrollSpeed *delta), _physicsNode.position.y);
     for (CCNode *ground in _grounds) {
     CGPoint groundWorldPosition = [_physicsNode convertToWorldSpace:ground.position];
     CGPoint groundScreenPosition = [self convertToNodeSpace:groundWorldPosition];
     if (groundScreenPosition.x <= (-2 * ground.contentSize.width)) {
     ground.position = ccp(ground.position.x +4 * ground.contentSize.width, ground.position.y);
     }
     }*/
    
    
    
    //collision check
    CCSprite *sprite = [self spriteCollisionWithRect:_knight.boundingBox];
    if (sprite!=nil) {
        
    }
    //Death Test
    //knightHP = knightHP-5;
    
}

//tap action and knight movement
- (void)touchBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //move knight
    _knight.position = ccp(_knight.position.x, _knight.position.y);
    CCActionMoveBy *moveNodeRight = [CCActionMoveBy actionWithDuration:1.0f position:ccp(40.0f, 0.0f)];
    [_knight runAction:moveNodeRight];
    
    
    
    if (_knight.position.x  >= width.width)
    {
        [[CCDirector sharedDirector] replaceScene:[CCBReader loadAsScene:@"BossIntro"]];
        //[self winning];
    }
    
    
}




@end

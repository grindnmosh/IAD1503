//
//  BossFight.m
//  KingdomsFall
//
//  Created by Robert Warren on 3/10/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "BossFight.h"
#import "GoldScoreObject.h"
#import "GCSupport.h"

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
    _menuButton.visible = false;
    //win lose labels
    _winner.visible = false;
    _gameOver.visible = false;
    _initials.visible = false;
    _subButt.visible = false;
    _highScore.visible = false;
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
                
                NSString *achievementIdentifier = @"KF666FK";
                NSString *level1Id = @"KF111FK";

                GKAchievement *reaped = [[GKAchievement alloc] initWithIdentifier:achievementIdentifier];
                GKAchievement *level1 = [[GKAchievement alloc] initWithIdentifier:level1Id];
                
                reaped.percentComplete = 100;
                level1.percentComplete = 100;
                
                NSArray *achieved = @[reaped, level1];
                [GKAchievement reportAchievements:achieved withCompletionHandler:^(NSError *error) {
                    if (error != nil) {
                        NSLog(@"%@", [error localizedDescription]);
                    }
                }];
                
                reaped.showsCompletionBanner = YES;
                level1.showsCompletionBanner = YES;
                
                [_reaper runAction:die];
                
            }
            
            
            return sprite;
                    }
    }
    
    return nil;
}

-(void)forTheMoney
{
    NSString *g2kId = @"KF2000FK";
    NSString *acId = @"KF2downFK";
    NSString *rcId = @"KF666FK";
    NSString *levelId = @"KF111FK";
    
    GKAchievement *g2k = nil;
    GKAchievement *ac = nil;
    GKAchievement *rc = nil;
    GKAchievement *level1 = nil;
    
    g2k = [[GKAchievement alloc] initWithIdentifier:g2kId];
    ac = [[GKAchievement alloc] initWithIdentifier:acId];
    rc = [[GKAchievement alloc] initWithIdentifier:rcId];
    level1 = [[GKAchievement alloc] initWithIdentifier:levelId];
    
    NSLog(@"runnnn");
    
    

    if (g2k.completed && ac.completed && rc.completed) {
        level1.percentComplete = 100;
        NSArray *achieved = @[level1];
        [GKAchievement reportAchievements:achieved withCompletionHandler:^(NSError *error) {
            if (error != nil) {
                NSLog(@"%@", [error localizedDescription]);
            }
        }];
        
        level1.showsCompletionBanner = YES;
    }
}

//Movement
- (void)touchBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //move knight
    _knight.position = ccp(_knight.position.x, _knight.position.y);
    
    
    CCActionMoveBy *moveNodeRight = [CCActionMoveBy actionWithDuration:1.0f position:ccp(40.0f, 0.0f)];
    [_knight runAction:moveNodeRight];
    if (_knight.position.x  >= width.width)
    {
        [self winning];
    }
    
    else if (knightHP <= 0)
    {
        [self losing];
    }
}

//Method for level completyion
-(void)winning
{

    GCSupport *score = [GCSupport alloc];
    score = [GCSupport sharedInstance];
    _winner.visible = true;
    goldAmount = goldAmount+2500;
    score.goldPass = &(goldAmount);
    NSLog(@"Gold:%ld", (long)goldAmount);
    [_goldLabel setString:[NSString stringWithFormat:@"%ld", (long)goldAmount]];
    
    _menuButton.visible = true;
    _initials.visible = true;
    _subButt.visible = true;
    _highScore.visible = true;
    [score reportScore];
}

//Method for dead knight
-(void)losing
{
    _gameOver.visible = true;
    goldAmount = 0;
    NSLog(@"Gold:%ld", (long)goldAmount);
    [_goldLabel setString:[NSString stringWithFormat:@"%ld", (long)goldAmount]];
    [[CCDirector sharedDirector] pause];
}

- (void)backToMenu:(id)sender
{
    [[CCDirector sharedDirector] replaceScene:[CCBReader loadAsScene:@"MainScene"]];
}

-(void)highScoreScreen:(id)sender
{
    [[CCDirector sharedDirector] replaceScene:[CCBReader loadAsScene:@"PersonalLeaderBoard"]];
}

-(void)submit:(id)sender
{
    NSString *pNameI = [_initials string];
    NSString *pGameGold = [_goldLabel string];
    GoldScoreObject *load = [[GoldScoreObject alloc] initWithGold:pNameI gold:pGameGold];
    GoldScoreObject *database = [GoldScoreObject sharedGoldArray];
    NSMutableArray *list = database.goldPiles;
    if (list != nil) {
        [list addObject:load];
    }
    listArray= [GoldScoreObject sharedGoldArray];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (defaults != nil)
    {
        int im = 0;
        continuos1 =[[NSMutableArray alloc] init];
        continuos2 =[[NSMutableArray alloc] init];
        for (int i =0; i < [listArray.goldPiles count]; i++)
        {
            
            NSString *load1 = [[listArray.goldPiles objectAtIndex:i] initials];
            NSString *load2 = [[listArray.goldPiles objectAtIndex:i] gameGold];
            
            im++;
            if (load1 != nil)
            {
                [continuos1 addObject:load1];
                [continuos2 addObject:load2];
                
            }
        }
        
        NSLog(@"%@", continuos1);
        [[NSUserDefaults standardUserDefaults]setObject:continuos1 forKey:@"player"];
        [[NSUserDefaults standardUserDefaults]setObject:continuos2 forKey:@"gold"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[CCDirector sharedDirector] replaceScene:[CCBReader loadAsScene:@"PersonalLeaderBoard"]];
    }
}



@end

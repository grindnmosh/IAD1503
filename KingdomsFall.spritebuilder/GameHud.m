//
//  GameHud.m
//  KingdomsFall
//
//  Created by Robert Warren on 2/11/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "GameHud.h"
#import "MarchBegins.h"

@implementation GameHud


- (void)didLoadFromCCB {
    
    //enable touch
    self.userInteractionEnabled = TRUE;
    _gamePausedLabel.visible = false;
    _resumePlay.visible = false;
}


- (id) init
{
    if (self = [super init]){
       
    }
    return self;
}


-(void)pauseResume:(id)sender
{
    
    if (sender == _pauseGame)
    {
        [[CCDirector sharedDirector] pause];
        _gamePausedLabel.visible = true;
        _pauseGame.visible = false;
        _resumePlay.visible = true;
        [[OALSimpleAudio sharedInstance] playBg:@"" loop:YES];
        self.userInteractionEnabled = false;
        
    }
    else if (sender == _resumePlay)
    {
        [[CCDirector sharedDirector] resume];
        _gamePausedLabel.visible = false;
        _pauseGame.visible = true;
        _resumePlay.visible = false;
        [[OALSimpleAudio sharedInstance] preloadBg:@"Alters.caf"];
        [[OALSimpleAudio sharedInstance] playBg:@"Alters.caf" loop:YES];
        self.userInteractionEnabled = TRUE;
    }
    
    
}




@end

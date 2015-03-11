//
//  MenuScene.m
//  KingdomsFall
//
//  Created by Robert Warren on 2/17/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "MenuScene.h"
#import "MarchBegins.h"


@implementation MenuScene

- (void)didLoadFromCCB {
    
    [[OALSimpleAudio sharedInstance] preloadBg:@"Alters.caf"];
    [[OALSimpleAudio sharedInstance] playBg:@"Alters.caf" loop:YES];
    
    //enable touch
    self.userInteractionEnabled = TRUE;
}

- (id) init
{
    if (self = [super init]){
        
    }
    return self;
}

- (void)startGame:(id)sender
{
    [[CCDirector sharedDirector] replaceScene:[CCBReader loadAsScene:@"Intro1"]];
}

- (void)instructions:(id)sender
{
    [[CCDirector sharedDirector] replaceScene:[CCBReader loadAsScene:@"Instructions"]];
}

- (void)gameCredits:(id)sender
{
    [[CCDirector sharedDirector] replaceScene:[CCBReader loadAsScene:@"GameCredits"]];
}


@end

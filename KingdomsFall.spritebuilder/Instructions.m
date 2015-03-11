//
//  Instructions.m
//  KingdomsFall
//
//  Created by Robert Warren on 2/17/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Instructions.h"

@implementation Instructions
- (void)didLoadFromCCB {
    
    [[OALSimpleAudio sharedInstance] preloadBg:@"bgm.caf"];
    [[OALSimpleAudio sharedInstance] playBg:@"bgm.caf" loop:YES];
    
    //enable touch
    self.userInteractionEnabled = TRUE;
}

- (id) init
{
    if (self = [super init]){
        
    }
    return self;
}

- (void)backToMenu:(id)sender
{
    [[CCDirector sharedDirector] replaceScene:[CCBReader loadAsScene:@"MainScene"]];
}
@end

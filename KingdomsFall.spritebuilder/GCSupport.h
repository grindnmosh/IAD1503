//
//  GCSupport.h
//  KingdomsFall
//
//  Created by Robert Warren on 3/18/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>
#import "BossFight.h"

@interface GCSupport : NSObject {
    BOOL gameCenterAvailable;
    BOOL userAuthenticated;
    NSString *_leaderboardIdentifier;
    NSInteger *goldPass;
}

@property (assign, readonly) BOOL gameCenterAvailable;
@property (nonatomic, assign) NSInteger *goldPass;

+ (GCSupport *)sharedInstance;
- (void)authenticateLocalUser;
- (void)reportScore;
@end

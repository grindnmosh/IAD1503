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
    @public BOOL g2k;
    BOOL ac;
    BOOL rd;
}

@property (assign, readonly) BOOL gameCenterAvailable;
@property (nonatomic, assign) NSInteger *goldPass;
@property (nonatomic, assign) BOOL g2k;

+ (GCSupport *)sharedInstance;
- (void)authenticateLocalUser;
- (void)reportScore;
@end

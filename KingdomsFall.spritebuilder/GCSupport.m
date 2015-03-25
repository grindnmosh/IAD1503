//
//  GCSupport.m
//  KingdomsFall
//
//  Created by Robert Warren on 3/18/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "GCSupport.h"

@implementation GCSupport

@synthesize gameCenterAvailable, goldPass, g2k;

#pragma mark Initialization

static GCSupport *sharedHelper = nil;
+ (GCSupport *) sharedInstance {
    if (!sharedHelper) {
        sharedHelper = [[GCSupport alloc] init];
    }
    return sharedHelper;
}

- (BOOL)isGameCenterAvailable {
    // check for presence of GKLocalPlayer API
    Class gcClass = (NSClassFromString(@"GKLocalPlayer"));
    
    // check if the device is running iOS 4.1 or later
    NSString *reqSysVer = @"4.1";
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    BOOL osVersionSupported = ([currSysVer compare:reqSysVer
                                           options:NSNumericSearch] != NSOrderedAscending);
    
    return (gcClass && osVersionSupported);
}

- (id)init {
    if ((self = [super init])) {
        gameCenterAvailable = [self isGameCenterAvailable];
        if (gameCenterAvailable) {
            NSNotificationCenter *nc =
            [NSNotificationCenter defaultCenter];
            [nc addObserver:self
                   selector:@selector(authenticationChanged)
                       name:GKPlayerAuthenticationDidChangeNotificationName
                     object:nil];
        }
    }
    return self;
}

- (void)authenticationChanged {
    
    if ([GKLocalPlayer localPlayer].isAuthenticated && !userAuthenticated) {
        NSLog(@"Authentication changed: player authenticated.");
        userAuthenticated = TRUE;
    } else if (![GKLocalPlayer localPlayer].isAuthenticated && userAuthenticated) {
        NSLog(@"Authentication changed: player not authenticated");
        userAuthenticated = FALSE;
    }
    
}

#pragma mark User functions

- (void)authenticateLocalUser {
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    if (!gameCenterAvailable) return;
    
    NSLog(@"Authenticating local user...");
    if ([GKLocalPlayer localPlayer].authenticated == NO) {
        localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error){
            // Get the default leaderboard identifier.
            [[GKLocalPlayer localPlayer] loadDefaultLeaderboardIdentifierWithCompletionHandler:^(NSString *leaderboardIdentifier, NSError *error) {
                        
                if (error != nil) {
                    NSLog(@"%@", [error localizedDescription]);
                } else {
                    _leaderboardIdentifier = leaderboardIdentifier;
                };
            }];
        };
    } else {
        NSLog(@"Already authenticated!");
    }
}

-(void)reportScore{
    
    GKScore *upScore = [[GKScore alloc] initWithLeaderboardIdentifier:_leaderboardIdentifier];
    upScore.value = (int64_t)goldPass;
    NSLog(@"UPSCORE INFO: %@", upScore);
    
    [GKScore reportScores:@[upScore] withCompletionHandler:^(NSError *error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
}

@end

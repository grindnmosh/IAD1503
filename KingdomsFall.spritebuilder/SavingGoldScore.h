//
//  SavingGoldScore.h
//  KingdomsFall
//
//  Created by Robert Warren on 3/17/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SavingGoldScore : NSObject
{
    NSString *initials;
    NSString *gameGold;
}

@property(nonatomic)NSString *initials;
@property(nonatomic)NSString *gameGold;

+(SavingGoldScore *) singleObj;

@end

//
//  GoldScoreObject.h
//  KingdomsFall
//
//  Created by Robert Warren on 3/17/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoldScoreObject : NSObject
{
    NSMutableArray *goldPiles;
    NSString *initials;
    NSString *ameGold;
}

@property(nonatomic)NSString *initials;
@property(nonatomic)NSString *gameGold;
@property(nonatomic, strong)NSMutableArray *goldPiles;

-(id)initWithGold:(NSString*)player gold:(NSString*)gold;

+(GoldScoreObject *) sharedGoldArray;
@end

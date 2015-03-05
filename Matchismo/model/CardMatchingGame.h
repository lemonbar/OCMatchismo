//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Li Meng on 15/3/5.
//  Copyright (c) 2015年 Li Meng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck;
-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

- (NSArray *)matchHistory;

@property (nonatomic,readonly) NSInteger score;
@property (nonatomic) NSInteger gameType; // the type of the game (0=two card, 1=three card)

@end

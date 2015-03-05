//
//  PlayingCard.m
//  Matchismo
//
//  Created by Li Meng on 15/3/4.
//  Copyright (c) 2015年 Li Meng. All rights reserved.
//

#import "PlayingCard.h"

@interface PlayingCard()

@property (strong,nonatomic) NSMutableArray *history;

@end

@implementation PlayingCard

-(int)match:(NSArray *)otherCards{
    int score = 0;
    int matchCount = 0;
    
    NSMutableArray *history = [[NSMutableArray alloc] init];
    
    // create a mutable array containing the other cards
    NSMutableArray *matchArray = [[NSMutableArray alloc] initWithArray:otherCards];
    [matchArray addObject:self];
    
    // iterate over all cards
    while ([matchArray count]) {
        Card *matchCard = matchArray.lastObject;
        
        // make cure card really is a PlayingCard
        if ([matchCard isKindOfClass:[PlayingCard class]]) {
            // cast it explicitely to PlayingCard
            PlayingCard *card = (PlayingCard *)matchCard;
            
            // remove it from the matchArray
            [matchArray removeObject:matchCard];
            
            // iterate over the remaining cards in the match array
            for (Card *otherMatchCard in matchArray) {
                if ([otherMatchCard isKindOfClass:[PlayingCard class]]) {
                    PlayingCard *otherCard = (PlayingCard *)otherMatchCard;
                    
                    // compare the two cards
                    if ([card.suit isEqualToString:otherCard.suit]) {
                        score += 1;
                        matchCount++;
                        [history addObject:[[NSString alloc] initWithFormat:@"Matched %@ and %@ for 1 point", card.contents, otherCard.contents]];
                    } else if (card.rank == otherCard.rank) {
                        score += 4;
                        matchCount++;
                        [history addObject:[[NSString alloc] initWithFormat:@"Matched %@ and %@ for 4 point", card.contents, otherCard.contents]];
                    }
                }
            }
        }
    }
    
    // check the number of matched cards to the gametype
    if (matchCount < [otherCards count]) {
        // we matched less cards (e.g. 2 in a 3 card game) than we should
        if (score > 1) {
            int penalty = (int) round(score * 0.2f);
            score -= penalty; // apply penalty
            [history addObject:[[NSString alloc] initWithFormat:@"Only matched %d of %lu cards, %d point penalty!", matchCount + 1, [otherCards count] + 1, penalty]];
        }
    }
    
    // do we have a score?
    if (!score) {
        //NSMutableString *cards = [[NSMutableString alloc] initWithFormat:@"%@%@", [PlayingCard rankStrings][self.rank], self.suit];
        NSMutableString *cardText = [[NSMutableString alloc] init];
        NSMutableArray *cards = [[NSMutableArray alloc] initWithArray:otherCards];
        [cards addObject:self];
        
        while ([cards count]) {
            Card *matchCard = cards.lastObject;
            [cards removeObject:matchCard];
            
            if ([matchCard isKindOfClass:[PlayingCard class]]) {
                PlayingCard *card = (PlayingCard *)matchCard;
                NSString *append = ([cards count]) ? (([cards count] > 1) ? @", " : @" and ") : @"";
                [cardText appendFormat:@"%@%@", card.contents, append];
            }
        }
        
        [history addObject:[[NSString alloc] initWithFormat:@"%@ do not match!", cardText]];
    }
    
    // store / overwrite history
    self.history = history;
    return score;
}

-(NSString *)contents{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+(NSArray *)validSuits{
    return @[@"♠️",@"♣️",@"♥️",@"♦️"];
}

@synthesize suit = _suit;

-(NSString *)suit{
    return _suit?_suit:@"?";
}

-(void)setSuit:(NSString *)suit{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

+(NSArray *)rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger)maxRank{
    return [[PlayingCard rankStrings] count]-1;
}

@end

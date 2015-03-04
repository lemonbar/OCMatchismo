//
//  Deck.m
//  Matchismo
//
//  Created by Li Meng on 15/3/4.
//  Copyright (c) 2015年 Li Meng. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (strong,nonatomic) NSMutableArray *cards;

@end

@implementation Deck

-(NSMutableArray *)cards{
    if(!_cards){
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
}

-(void)addCard:(Card *)card atTop:(BOOL)atTop{
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    }else{
        [self.cards addObject:card];
    }
}

-(void)addCard:(Card *)card{
    [self addCard:card atTop:false];
}

-(Card *)drawRandomCard{
    Card *randomCard = nil;
    if([self.cards count]){
        unsigned index = arc4random()%[self.cards count];
        randomCard = [self.cards objectAtIndex:index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}

@end

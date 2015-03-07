//
//  PlayingMatchCardViewController.m
//  Matchismo
//
//  Created by Li Meng on 15/3/7.
//  Copyright (c) 2015年 Li Meng. All rights reserved.
//

#import "PlayingMatchCardViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingMatchCardViewController ()

@end

@implementation PlayingMatchCardViewController

-(Deck *)createDeck{
    return [[PlayingCardDeck alloc]init];
}

@end

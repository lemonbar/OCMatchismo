//
//  ViewController.h
//  Matchismo
//
//  Created by Li Meng on 15/3/4.
//  Copyright (c) 2015年 Li Meng. All rights reserved.
// Asbtract class.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface PlayingCardViewController : UIViewController

//abstract method.
-(Deck *)createDeck;

@end


//  Note: Private Implementation.
//  Card.m
//  Matchismo
//
//  Created by Li Meng on 15/3/4.
//  Copyright (c) 2015年 Li Meng. All rights reserved.
//

#import "Card.h"

@interface Card()
//Note: private declarations can go here.
@end

@implementation Card //Note: super class is not specified here.

-(int)match:(NSArray *)otherCards{
    int score = 0;
    
    for (Card *card in otherCards) {
        //Note: we are calling the “getter” for the contents @Property, (both on our self and on the passed card). This calling syntax is called “dot notation.”
        //It's only for setters and getters.
        if([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    }
    
    return score;
}

//Note: This is the @property implementation that the compiler generates automatically for you (behind the scenes). You are welcome to write the setter or getter yourself, but this would only be necessary if you needed to do something in addition to simply setting or getting the value of the property.

//@synthesize contents = _contents;
//- (NSString *)contents
//{
//    return _contents;
//}
//- (void)setContents:(NSString *)contents
//{
//    _contents = contents;
//}

@end

//  Note: Public Declarations.
//  Card.h
//  Matchismo
//
//  Created by Li Meng on 15/3/4.
//  Copyright (c) 2015年 Li Meng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

//Note: ALL objects live in the heap (i.e. are pointed to) in Objective-C!
@property (strong,nonatomic) NSString *contents;

//Note: Primitive types are not stored in the heap, so there’s no need to specify how the storage for them in the heap is treated
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic,getter=isMatched) BOOL matched;

-(int)match:(NSArray *)otherCards;

-(NSArray *)matchHistory;

@end

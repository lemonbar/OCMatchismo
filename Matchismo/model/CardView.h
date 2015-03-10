//
//  CardView.h
//  Matchismo
//
//  Created by Li Meng on 15/3/10.
//  Copyright (c) 2015年 Li Meng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardView : UIView

@property (nonatomic) NSUInteger rank;
@property (nonatomic,strong) NSString *suite;
@property (nonatomic) BOOL faceUp;

@end

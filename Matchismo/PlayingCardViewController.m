//
//  ViewController.m
//  Matchismo
//
//  Created by Li Meng on 15/3/4.
//  Copyright (c) 2015年 Li Meng. All rights reserved.
//

#import "PlayingCardViewController.h"
//#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface PlayingCardViewController ()

@property (strong,nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *matchModelSegmented;
@property (weak, nonatomic) IBOutlet UITextView *gameHistory;
@property (weak, nonatomic) IBOutlet UISlider *gameHistorySlider;

@end

@implementation PlayingCardViewController
- (IBAction)changeGameMode:(UISegmentedControl *)sender {
    self.game.gameType = sender.selectedSegmentIndex;
}

-(CardMatchingGame *)game{
    if(!_game){
        _game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    }
    return _game;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateGameHistorySlider];
}

- (void)updateGameHistorySlider {
    int count =  (int) [[self.game matchHistory] count] - 1;
    self.gameHistorySlider.maximumValue = count;
    self.gameHistorySlider.value = self.gameHistorySlider.maximumValue;
    self.gameHistorySlider.enabled = (count > 0) ? YES : NO;
}

- (IBAction)changeHistorySlider:(UISlider *)sender {
    int element = (int) round(self.gameHistorySlider.value);
    if (element < 0) element = 0;
    
    // set text to display history
    NSArray *history = [[self.game matchHistory] objectAtIndex:element];
    self.gameHistory.text = [history componentsJoinedByString:@"\n"];
    
    // change text color when we're looking at the past
    if (element == self.gameHistorySlider.maximumValue) {
        self.gameHistory.textColor = [UIColor blackColor];
    } else {
        self.gameHistory.textColor = [UIColor redColor];
    }
}

-(Deck *)createDeck{
    return nil;
}
- (IBAction)redealButton:(UIButton *)sender {
    //enable model segemented controller.
    self.matchModelSegmented.enabled = YES;
    
    self.game = nil;
    self.game.gameType = self.matchModelSegmented.selectedSegmentIndex;
    [self updateUI];
}

- (IBAction)cardTouchButton:(UIButton *)sender {
    //disable model segmented controller.
    self.matchModelSegmented.enabled = NO;
    
    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    
    NSArray *lastMatchHistory = [[self.game matchHistory] lastObject];
    self.gameHistory.text = [lastMatchHistory componentsJoinedByString:@"\n"];

    [self updateUI];
}

-(void)updateUI{
    for(UIButton *cardButton in self.cardButtons){
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",(int)self.game.score];
    [self updateGameHistorySlider];
}

-(NSString *)titleForCard:(Card *)card{
    return card.isChosen?card.contents:@"";
}

-(UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen?@"cardfront":@"cardback"];
}

@end

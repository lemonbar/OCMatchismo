//
//  TextStatsViewController.m
//  Matchismo
//
//  Created by Li Meng on 15/3/7.
//  Copyright (c) 2015年 Li Meng. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *coloredCharactersLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlinedCharactersLabel;

@end

@implementation TextStatsViewController

-(void)setTextToAnalyze:(NSAttributedString *)textToAnalyze{
    _textToAnalyze = textToAnalyze;
    if(self.view.window) [self updateUI];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
}

-(NSAttributedString *)charactersWithAttribute:(NSString *)attributeName{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]init];
    int index = 0;
    while (index<[self.textToAnalyze length]) {
        NSRange range;
        id value = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if(value) {
            [attributedString appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = range.location + range.length;
        }else{
            index++;
        }
    }
    return attributedString;
}

-(void)updateUI{
    self.coloredCharactersLabel.text = [NSString stringWithFormat:@"%lu colored characters",[[self charactersWithAttribute:NSForegroundColorAttributeName] length]];
    self.outlinedCharactersLabel.text = [NSString stringWithFormat:@"%lu outlined characters", [[self charactersWithAttribute:NSStrokeWidthAttributeName] length]];
}

@end

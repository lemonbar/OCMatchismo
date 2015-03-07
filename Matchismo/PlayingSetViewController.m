//
//  PlayingSetViewController.m
//  Matchismo
//
//  Created by Li Meng on 15/3/6.
//  Copyright (c) 2015年 Li Meng. All rights reserved.
//

#import "PlayingSetViewController.h"

@interface PlayingSetViewController ()
@property (weak, nonatomic) IBOutlet UILabel *headerline;
@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UIButton *outlineButton;

@end

@implementation PlayingSetViewController
- (IBAction)touchOutlineButton:(UIButton *)sender {
    [self.body.textStorage addAttributes:@{NSStrokeWidthAttributeName:@-3,
                                           NSStrokeColorAttributeName:[UIColor orangeColor]}
                                   range:self.body.selectedRange];
}
- (IBAction)touchUnoutlineButton:(UIButton *)sender {
    [self.body.textStorage removeAttribute:NSStrokeWidthAttributeName
                                     range:self.body.selectedRange];
}
- (IBAction)touchChangeFontColorButton:(UIButton *)sender {
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName
                                  value:sender.backgroundColor
                                  range:self.body.selectedRange];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:self.outlineButton.currentTitle];
    [title addAttributes:@{NSStrokeWidthAttributeName:@3,
                           NSStrokeColorAttributeName:self.outlineButton.tintColor} range:NSMakeRange(0, [title length])];
    [self.outlineButton setAttributedTitle:title forState:UIControlStateNormal];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self usePreferredFont];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(preferredFontsChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];//must invoke parent method.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIContentSizeCategoryDidChangeNotification
                                                  object:nil];
}

-(void)preferredFontsChanged:(NSNotification *)notification{
    [self usePreferredFont];
}

-(void)usePreferredFont{
    self.headerline.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    self.body.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

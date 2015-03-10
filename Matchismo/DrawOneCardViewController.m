//
//  DrawOneCardViewController.m
//  Matchismo
//
//  Created by Li Meng on 15/3/10.
//  Copyright (c) 2015年 Li Meng. All rights reserved.
//

#import "DrawOneCardViewController.h"
#import "CardView.h"

@interface DrawOneCardViewController ()
@property (weak, nonatomic) IBOutlet CardView *playingCardView;

@end

@implementation DrawOneCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.playingCardView.rank = 13;
    self.playingCardView.suite = @"♥️";
    // Do any additional setup after loading the view.
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

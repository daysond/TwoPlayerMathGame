//
//  ViewController.m
//  TwoPlayerMathGame
//
//  Created by Dayson Dong on 2019-05-06.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "ViewController.h"
#import "GameManager.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *playerOneScore;
@property (weak, nonatomic) IBOutlet UILabel *playerTwoScore;
@property (nonatomic) GameManager *gameManager;
@property (nonatomic) NSMutableString *userAnswer;
@property (weak, nonatomic) IBOutlet UILabel *answerDisplayLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@end

@implementation ViewController
- (IBAction)buttonPressed:(UIButton *)sender {
    
    NSString* num = sender.currentTitle;
    [self.userAnswer appendString:num];
    self.answerDisplayLabel.text = self.userAnswer;
}
- (IBAction)submitButtonPressed:(UIButton *)sender {
    [self.gameManager updateGameWithAnswer:[self.userAnswer integerValue]];
    NSString* score = (NSString* )[self.gameManager.players[self.gameManager.currentPlayer] score]
    self.playerOneScore.text =  score ;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userAnswer = [[NSMutableString alloc]initWithString:@""];
    self.gameManager = [[GameManager alloc]init];
    _questionLabel.text = [self.gameManager generateQuestion];
}


@end

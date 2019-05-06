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
@property (weak, nonatomic) IBOutlet UILabel *p1Life;
@property (weak, nonatomic) IBOutlet UILabel *p2Life;
@property (nonatomic) GameManager *gameManager;
@property (nonatomic) NSMutableString *userAnswer;
@property (weak, nonatomic) IBOutlet UILabel *answerDisplayLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *correctLabel;
@end

@implementation ViewController
- (IBAction)buttonPressed:(UIButton *)sender {
    
    NSString* num = sender.currentTitle;
    [self.userAnswer appendString:num];
    self.answerDisplayLabel.text = self.userAnswer;
    [self.answerDisplayLabel setHidden:NO];
}
- (IBAction)submitButtonPressed:(UIButton *)sender {
    
    NSString* correctOrNot = [self.gameManager updateGameWithAnswer:[self.userAnswer integerValue]];
    NSString* score = [NSString stringWithFormat:@"%@ score: %ld",[_gameManager.activePlayer name],[_gameManager.activePlayer score]];
    NSString* life = [NSString stringWithFormat:@"%@ Life: %ld",[_gameManager.activePlayer name],[_gameManager.activePlayer life]];
    
    if ([self.gameManager.activePlayer.name isEqualToString:@"Player 1"]) {
        _playerOneScore.text = score;
        _p1Life.text = life;
    } else {
        _playerTwoScore.text = score;
        _p2Life.text = life;
    }
    self.correctLabel.text = correctOrNot;
    if([correctOrNot isEqualToString:@"Correct!"]){
        self.correctLabel.textColor = [UIColor greenColor];
    
    } else if ([correctOrNot isEqualToString:@"Incorrect!"]) {
         self.correctLabel.textColor = [UIColor redColor];
    }
   [self.correctLabel setHidden:NO];
    
    
    [self.gameManager switchPlayer];
    _questionLabel.text = [self.gameManager generateQuestion];
    
    self.userAnswer = [NSMutableString stringWithString:@""];
    self.answerDisplayLabel.text = self.userAnswer;
    
    if ([self.gameManager isGameOver]) {
        self.questionLabel.text = @"GAME OVER";
        sender.enabled = false;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userAnswer = [[NSMutableString alloc]initWithString:@""];
    self.gameManager = [[GameManager alloc]init];
    _questionLabel.text = [self.gameManager generateQuestion];
    [self.answerDisplayLabel setHidden:YES];
    [self.correctLabel setHidden:YES];
}


@end

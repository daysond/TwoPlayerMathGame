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

#pragma mark - delegate method

- (void)gameOver {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Game Over!"
                                                                   message:@"Do you want to restart?"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* restart = [UIAlertAction actionWithTitle:@"Restart" style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction * action) {self.gameManager = [[GameManager alloc] init];
                                                        [self updateUI];
                                                        self.questionLabel.text = [self.gameManager generateQuestion];
                                                    }];
    
    UIAlertAction* doNotRestart = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){self.questionLabel.text = @"GAME OVER";}];
    
    [alert addAction:restart];
    [alert addAction:doNotRestart];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - helpers

-(void)updateUI {
    _playerOneScore.text = [NSString stringWithFormat: @"Player 1 score: %ld",(long)[self.gameManager.players[0] score]];
    _playerTwoScore.text = [NSString stringWithFormat: @"Player 2 score: %ld",(long)[self.gameManager.players[1] score]];
    _p1Life.text = [NSString stringWithFormat: @"Player 1 life: %ld",(long)[self.gameManager.players[0] life]];
    _p2Life.text = [NSString stringWithFormat: @"Player 2 life: %ld",(long)[self.gameManager.players[1] life]];
    self.userAnswer = [NSMutableString stringWithString:@""];
}

-(void)newRound {
    [self.gameManager switchPlayer];
    _questionLabel.text = [self.gameManager generateQuestion];
    self.answerDisplayLabel.text = self.userAnswer;
}

#pragma mark - IBActions

- (IBAction)buttonPressed:(UIButton *)sender {
    
    NSString* num = sender.currentTitle;
    [self.userAnswer appendString:num];
    self.answerDisplayLabel.text = self.userAnswer;
    
}

- (IBAction)submitButtonPressed:(UIButton *)sender {
    
    self.correctLabel.alpha = 100;
    self.correctLabel.text = @"";
    if ([self.userAnswer length] == 0) {
        return;
    }
    
    NSString* correctOrNot = [self.gameManager updateGameWithAnswer:[self.userAnswer integerValue]];

    self.correctLabel.text = correctOrNot;
    
    ([correctOrNot isEqualToString:@"Correct!"]) ? (self.correctLabel.textColor = [UIColor greenColor]) : ( self.correctLabel.textColor = [UIColor redColor] );
    
    [UIView animateWithDuration:1 animations:^{self.correctLabel.alpha = 0;}];
   
    [self updateUI];
    [self newRound];
    
}

#pragma mark - viewDidLoad

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userAnswer = [[NSMutableString alloc]initWithString:@""];
    self.gameManager = [[GameManager alloc]init];
    self.gameManager.gameDelegate = self;
    [self updateUI];
    _questionLabel.text = [self.gameManager generateQuestion];

}





@end

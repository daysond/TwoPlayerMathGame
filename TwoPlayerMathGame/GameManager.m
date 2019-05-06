//
//  GameManager.m
//  TwoPlayerMathGame
//
//  Created by Dayson Dong on 2019-05-06.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "GameManager.h"

@interface GameManager()



@end

@implementation GameManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _answer = 0;
        _players = [[NSArray alloc]initWithObjects:[[Player alloc]initWithName:@"Player 1"],[[Player alloc]initWithName:@"Player2"], nil];
        _currentPlayer = 0;
        _isGameOver = NO;
    }
    return self;
}

#pragma mark - private

-(NSUInteger)randomValue {
    return arc4random_uniform(20)+1;
}


#pragma mark - public

- (NSString* )generateQuestion {
    
    NSInteger lhs = [self randomValue];
    NSInteger rhs = [self randomValue];
    self.answer = lhs + rhs;
    return [NSString stringWithFormat:@"%ld + %ld = ?",lhs,rhs];
    
}

- (void)updateGameWithAnswer:(NSInteger)answer {
    
    Player * currentPlayer = self.players[self.currentPlayer];
    if (self.answer == answer) {
        currentPlayer.score ++;
    } else {
        currentPlayer.life --;
    }
    
    if (currentPlayer.life == 0) {
        self.isGameOver = YES;
    }
    
    if (self.currentPlayer == 1) {
        self.currentPlayer = 0;
    } else if (self.currentPlayer == 0 ){
        self.currentPlayer = 1;
    }

    
}

@end

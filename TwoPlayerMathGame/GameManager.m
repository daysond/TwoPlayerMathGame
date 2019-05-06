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
        _players = [[NSArray alloc]initWithObjects:[[Player alloc]initWithName:@"Player 1"],[[Player alloc]initWithName:@"Player 2"], nil];
        _activePlayer = self.players[0];
        _isGameOver = NO;
    }
    return self;
}

#pragma mark - private

-(NSUInteger)randomValue {
    return arc4random_uniform(20)+1;
}

-(NSInteger)randomQuestion {
    return arc4random_uniform(4);
}

#pragma mark - public

- (NSString* )generateQuestion {
    
    NSInteger lhs = [self randomValue];
    NSInteger rhs = [self randomValue];
    NSInteger questionIndex = [self randomQuestion];
    switch (questionIndex) {
        case 0:
            self.answer = lhs + rhs;
            return [NSString stringWithFormat:@"%@: %ld + %ld = ?",self.activePlayer.name,lhs,rhs];
        case 1:
            self.answer = lhs - rhs;
            return [NSString stringWithFormat:@"%@: %ld - %ld = ?",self.activePlayer.name,lhs,rhs];
        case 2:
            self.answer = lhs * rhs;
            return [NSString stringWithFormat:@"%@: %ld x %ld = ?",self.activePlayer.name,lhs,rhs];
        case 3:
            while (rhs == 0) {
                rhs = [self randomValue];
            }
            self.answer = lhs / rhs;
            return [NSString stringWithFormat:@"%@: %ld / %ld = ?",self.activePlayer.name,lhs,rhs];
        default:
            return nil;

    }

    
}

- (NSString*)updateGameWithAnswer:(NSInteger)answer {
    
    if (self.answer == answer) {
        self.activePlayer.score ++;
        return @"Correct!";
    } else {
        self.activePlayer.life --;
        
        if (self.activePlayer.life == 0) {
            self.isGameOver = YES;
        }
        
        return @"Incorrect!";
    }
    

    
}
-(void)switchPlayer {
    if ([self.activePlayer.name isEqualToString:@"Player 1"]) {
        self.activePlayer = self.players[1];
    } else if ([self.activePlayer.name isEqualToString:@"Player 2"]) {
        self.activePlayer = self.players[0];
    }
}

@end

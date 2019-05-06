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


#pragma mark - public

- (NSString* )generateQuestion {
    
    NSInteger lhs = [self randomValue];
    NSInteger rhs = [self randomValue];
    self.answer = lhs + rhs;
    return [NSString stringWithFormat:@"%@: %ld + %ld = ?",self.activePlayer.name,lhs,rhs];
    
}

- (void)updateGameWithAnswer:(NSInteger)answer {
    
    if (self.answer == answer) {
        self.activePlayer.score ++;
    } else {
        self.activePlayer.life --;
    }
    
    if (self.activePlayer.life == 0) {
        self.isGameOver = YES;
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

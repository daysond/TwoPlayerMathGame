//
//  GameManager.h
//  TwoPlayerMathGame
//
//  Created by Dayson Dong on 2019-05-06.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameManager : NSObject

@property (nonatomic)NSInteger answer;
@property (nonatomic)NSArray <Player*> *players;
@property (nonatomic)NSInteger currentPlayer;
@property (nonatomic)BOOL isGameOver;

-(void)updateGameWithAnswer:(NSInteger) answer;
-(NSString*)generateQuestion;


@end

NS_ASSUME_NONNULL_END

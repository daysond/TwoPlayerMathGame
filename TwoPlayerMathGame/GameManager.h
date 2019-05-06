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

@protocol GameManagerDelegate <NSObject>

-(void)gameOver;

@end

@interface GameManager : NSObject

@property (nonatomic)NSInteger answer;
@property (nonatomic)NSArray <Player*> *players;
@property (nonatomic)Player* activePlayer;
@property (weak,nonatomic) id<GameManagerDelegate> gameDelegate;

-(NSString*)updateGameWithAnswer:(NSInteger) answer;
-(NSString*)generateQuestion;
-(void)switchPlayer;


@end

NS_ASSUME_NONNULL_END

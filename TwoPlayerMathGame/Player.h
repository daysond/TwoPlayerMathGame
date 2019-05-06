//
//  Player.h
//  TwoPlayerMathGame
//
//  Created by Dayson Dong on 2019-05-06.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Player : NSObject

@property (nonatomic)NSInteger life;
@property (nonatomic)NSInteger score;
@property (nonatomic)NSString* name;


- (instancetype)initWithName: (NSString* ) name;

@end

NS_ASSUME_NONNULL_END

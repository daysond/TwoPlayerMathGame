//
//  Player.m
//  TwoPlayerMathGame
//
//  Created by Dayson Dong on 2019-05-06.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "Player.h"

@implementation Player


- (instancetype)initWithName: (NSString* ) name
{
    self = [super init];
    if (self) {
        _life = 3;
        _score = 0;
        _name = name;
    }
    return self;
}

@end

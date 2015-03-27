//
//  IAAStarWarsUniverse.h
//  StarWars
//
//  Created by Ivan on 27/03/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IAAStarWarsCharacter.h"

@interface IAAStarWarsUniverse : NSObject

@property (nonatomic,readonly) NSUInteger rebelsCount;
@property (nonatomic,readonly) NSUInteger imperialsCount;

- (IAAStarWarsCharacter *) rebelAtIndex: (NSUInteger) index;
- (IAAStarWarsCharacter *) imperialAtIndex: (NSUInteger) index;
@end

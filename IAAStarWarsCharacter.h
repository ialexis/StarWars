//
//  IAAStarWarsCharacter.h
//  StarWars
//
//  Created by Ivan on 24/03/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

@import Foundation;
@import UIKit;



@interface IAAStarWarsCharacter : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *alias;
@property (strong, nonatomic) NSURL *wikiURL;
@property (strong, nonatomic) NSData *soundData;
@property (strong, nonatomic) UIImage *photo;

//designated
-(id) initWithName: (NSString *) name
             alias: (NSString *) alias
           wikiURL: (NSURL *) wikiURL
         soundData: (NSData *) soundData
             photo: (UIImage *) photo;

-(id) initWithAlias: (NSString *) alias
           wikiURL: (NSURL *) wikiURL
         soundData: (NSData *) soundData
             photo: (UIImage *) photo;

@end

//
//  IAAStarWarsCharacter.m
//  StarWars
//
//  Created by Ivan on 24/03/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "IAAStarWarsCharacter.h"

@implementation IAAStarWarsCharacter


//designated init
-(id) initWithName: (NSString *) name
             alias: (NSString *) alias
           wikiURL: (NSURL *) wikiURL
         soundData: (NSData *) soundData
             photo: (UIImage *) photo
{
        if (self=[super init])
        {
            _name=name;
            _alias=alias;
            _wikiURL=wikiURL;
            _soundData=soundData;
            _photo=photo;
        }
    return self;
}


// initcializador de conveniniencia
-(id) initWithAlias: (NSString *) alias
            wikiURL: (NSURL *) wikiURL
          soundData: (NSData *) soundData
              photo: (UIImage *) photo{
    return [self initWithName:nil
                        alias:alias
                      wikiURL:wikiURL
                    soundData:soundData
                        photo:photo];
}

@end

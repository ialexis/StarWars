//
//  IAAStarWarsUniverse.m
//  StarWars
//
//  Created by Ivan on 27/03/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "IAAStarWarsUniverse.h"

@interface IAAStarWarsUniverse()

@property (nonatomic,strong)NSArray * rebels;
@property (nonatomic,strong)NSArray * imperials;

@end



@implementation IAAStarWarsUniverse

- (id) init
{
    
    if (self = [super init])
    {
        //creamos los personajes
        NSBundle *b = [NSBundle mainBundle];
        
        //vader
        
        NSURL *vaderURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Darth_Vader"];
        
        
        NSData *vaderSound = [NSData dataWithContentsOfURL:[b URLForResource:@"vader" withExtension:@"caf"]];
        UIImage *vaderImage=[UIImage imageNamed:@"darthVader.jpg"];
        
        
        IAAStarWarsCharacter *vader=[[IAAStarWarsCharacter alloc]
                                     initWithName:@"Anakin Skywalker"
                                     alias:@"Darth Vader"
                                     wikiURL:vaderURL
                                     soundData:vaderSound
                                     photo:vaderImage];
        //Yoda
        
        NSURL *yodaURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Yoda"];
        
        
        NSData *yodaSound = [NSData dataWithContentsOfURL:[b URLForResource:@"yoda" withExtension:@"caf"]];
        UIImage *yodaImage=[UIImage imageNamed:@"yoda.jpg"];
        
        
        IAAStarWarsCharacter *yoda=[[IAAStarWarsCharacter alloc]
                                    initWithName:@"Minch Yoda"
                                    alias:@"Master Yoda"
                                    wikiURL:yodaURL
                                    soundData:yodaSound
                                    photo:yodaImage];
        
        //C3PO
        
        NSURL *c3poURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/C-3PO"];
        
        
        NSData *c3poSound = [NSData dataWithContentsOfURL:[b URLForResource:@"c3po" withExtension:@"caf"]];
        UIImage *c3poImage=[UIImage imageNamed:@"c3po.jpg"];
        
        
        IAAStarWarsCharacter *c3po=[[IAAStarWarsCharacter alloc]
                                    initWithAlias:@"C3PO"
                                    wikiURL:c3poURL
                                    soundData:c3poSound
                                    photo:c3poImage];
        //Chewbacca
        
        NSURL *chewieURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Chewbacca"];
        
        
        NSData *chewieSound = [NSData dataWithContentsOfURL:[b URLForResource:@"chewbacca" withExtension:@"caf"]];
        UIImage *chewieImage=[UIImage imageNamed:@"chewbacca.jpg"];
        
        
        IAAStarWarsCharacter *chewie=[[IAAStarWarsCharacter alloc]
                                      initWithAlias:@"chewbacca"
                                      wikiURL:chewieURL
                                      soundData:chewieSound
                                      photo:chewieImage];
        
        //R2D2
        
        NSURL *r2d2URL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/R2-D2"];
        
        
        NSData *r2d2Sound = [NSData dataWithContentsOfURL:[b URLForResource:@"r2-d2" withExtension:@"caf"]];
        UIImage *r2d2Image=[UIImage imageNamed:@"R2-D2.jpg"];
        
        
        IAAStarWarsCharacter *r2d2=[[IAAStarWarsCharacter alloc]
                                    initWithAlias:@"R2-D2"
                                    wikiURL:r2d2URL
                                    soundData:r2d2Sound
                                    photo:r2d2Image];
        
        //Palpatine
        
        NSURL *palpatineURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Palpatine"];
        
        
        NSData *palpatineSound = [NSData dataWithContentsOfURL:[b URLForResource:@"palpatine" withExtension:@"caf"]];
        UIImage *palpatineImage=[UIImage imageNamed:@"palpatine.jpg"];
        
        
        IAAStarWarsCharacter *palpatine=[[IAAStarWarsCharacter alloc]
                                    initWithName:@"Palpatine"
                                    alias:@"Darth Sidious"
                                    wikiURL:palpatineURL
                                    soundData:palpatineSound
                                    photo:palpatineImage];

        
        //Tarkin
        
        NSURL *tarkinURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Tarkin"];
        
        
        NSData *tarkinSound = [NSData dataWithContentsOfURL:[b URLForResource:@"tarkin" withExtension:@"caf"]];
        UIImage *tarkinImage=[UIImage imageNamed:@"tarkin.jpg"];
        
        
        IAAStarWarsCharacter *tarkin=[[IAAStarWarsCharacter alloc]
                                         initWithName:@"Wilhuf Tarkin"
                                         alias:@"Grand Moff Tarkin"
                                         wikiURL:tarkinURL
                                         soundData:tarkinSound
                                         photo:tarkinImage];

        
        self.imperials =@[vader,tarkin,palpatine];
        self.rebels =  @[chewie, c3po, r2d2, yoda];
    }
    return self;
}

#pragma mark - Properties

- (NSUInteger) rebelsCount
{
    return [self.rebels count];
}


- (NSUInteger) imperialsCount
{
    return [self.imperials count];
}


#pragma mark - Accessors
- (IAAStarWarsCharacter *) rebelAtIndex: (NSUInteger) index
{
    return [self.rebels objectAtIndex:index];
}
- (IAAStarWarsCharacter *) imperialAtIndex: (NSUInteger) index
{
    return [self.imperials objectAtIndex:index];
}
@end

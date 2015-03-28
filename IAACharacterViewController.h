//
//  IAACharacterViewController.h
//  StarWars
//
//  Created by Ivan on 24/03/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

@import UIKit;
#import "IAAStarWarsCharacter.h"
#import "CafPlayer.h"
#import "IAAWikiViewController.h"

@interface IAACharacterViewController : UIViewController <UISplitViewControllerDelegate>

@property (nonatomic,strong) IAAStarWarsCharacter *model;
@property (nonatomic, strong) CafPlayer *player;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

- (IBAction)playSound:(id)sender;
- (IBAction)displayWiki:(id)sender;

-(id) initWithModel: (IAAStarWarsCharacter *) model;

@end

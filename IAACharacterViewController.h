//
//  IAACharacterViewController.h
//  StarWars
//
//  Created by Ivan on 24/03/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

@import UIKit;
#import "IAAStarWarsCharacter.h"

@interface IAACharacterViewController : UIViewController

@property (nonatomic,strong) IAAStarWarsCharacter *model;

@property (weak, nonatomic) IBOutlet UIImageView *photoView;


-(id) initWithModel: (IAAStarWarsCharacter *) model;

@end

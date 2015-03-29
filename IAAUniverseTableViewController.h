//
//  IAAUniverseTableViewController.h
//  StarWars
//
//  Created by Ivan on 27/03/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//


#define IMPERIAL_SECTION 0
#define REBEL_SECTION 1
#define DID_SELECT_NEW_CHARACTER_NOTIFICATION_NAME @"NEW_CHARACTER"

#import <UIKit/UIKit.h>
#import "IAAStarWarsUniverse.h"

@class IAAUniverseTableViewController;

@protocol IAAUniverseTableViewControllerDelgate <NSObject>

@optional

- (void) universeTableViewController:(IAAUniverseTableViewController *) uVC didSelectCharacter:(IAAStarWarsCharacter *) character;


@end



@interface IAAUniverseTableViewController : UITableViewController

@property (strong,nonatomic) IAAStarWarsUniverse *model;
@property (weak, nonatomic) id<IAAUniverseTableViewControllerDelgate> delegate;

-(id) initWithModel: (IAAStarWarsUniverse *) model style:(UITableViewStyle)style;

@end

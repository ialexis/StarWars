//
//  IAAUniverseTableViewController.h
//  StarWars
//
//  Created by Ivan on 27/03/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//


#define IMPERIAL_SECTION 0
#define REBEL_SECTION 1

#import <UIKit/UIKit.h>
#import "IAAStarWarsUniverse.h"




@interface IAAUniverseTableViewController : UITableViewController

@property (strong,nonatomic) IAAStarWarsUniverse *model;


-(id) initWithModel: (IAAStarWarsUniverse *) model style:(UITableViewStyle)style;

@end

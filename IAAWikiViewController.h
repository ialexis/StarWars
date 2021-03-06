//
//  IAAWikiViewController.h
//  StarWars
//
//  Created by Ivan on 25/03/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IAAStarWarsCharacter.h"
//#define DID_SELECT_NEW_CHARACTER_NOTIFICATION_NAME @"NEW_CHARACTER"

@interface IAAWikiViewController : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *browser;
@property (nonatomic,strong) IAAStarWarsCharacter *model;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;


-(id) initWithModel:(IAAStarWarsCharacter *) model;

@end

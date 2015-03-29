//
//  IAAWikiViewController.m
//  StarWars
//
//  Created by Ivan on 25/03/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "IAAWikiViewController.h"
#import "IAAUniverseTableViewController.h" //para tener acceso a los nombres de las constantes de cara a las notificaciones


@implementation IAAWikiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //asegurarse que no se ocupa toda la pantalla cuando estas en un combinador
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    //asignamos delegado
    self.browser.delegate = self;
    //sincronizamos modelo y vista
    
    [self syncWithModel];
    
    
    
    //nos damos de alta en la notificacion de aviso cuando se cambie de personaje
    NSNotificationCenter *nCenter = [NSNotificationCenter defaultCenter];
    [nCenter addObserver:self
                selector:@selector (notifyStarWarsCharacterDidChange:)
                    name:DID_SELECT_NEW_CHARACTER_NOTIFICATION_NAME
                  object:nil];

}

-(void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    //nos damos de baja de las notificaciones
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - notifications

-(void) notifyStarWarsCharacterDidChange: (NSNotification *) notification
{
    NSDictionary *dict = [notification userInfo];
    
    IAAStarWarsCharacter *newCharacter = [dict objectForKey:@"STAR_WARS_CHARACTER"];
    
    //actualizamos el modelo
    self.model=newCharacter;
    
    //Sincronizamos vista y modelo
    [self syncWithModel];
}

-(void) syncWithModel
{
    [self.activityView setHidden:NO];
    [self.activityView startAnimating];
    
    self.title=self.model.alias;
    
    [self.browser loadRequest:[NSURLRequest requestWithURL:self.model.wikiURL]];

}


#pragma mark - Inicialized

-(id) initWithModel:(IAAStarWarsCharacter *) model
{
    if (self=[super init])
    {
        _model=model;
        self.title = @"Wikipedia";
    }
    return self;
}

#pragma mark - UIWebViewDelegate
-(void) webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityView setHidden:YES];
}

-(BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType
{
    if ((navigationType==UIWebViewNavigationTypeLinkClicked) ||
        (navigationType==UIWebViewNavigationTypeFormSubmitted))
    {
        return false;

    }
    else{
        return true;
    }
}

-(void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self.activityView setHidden:YES];

    NSLog(@"error fatal de la muerte: %@", error.description);
}
@end

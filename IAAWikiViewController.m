//
//  IAAWikiViewController.m
//  StarWars
//
//  Created by Ivan on 25/03/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "IAAWikiViewController.h"


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
    
    [self.activityView setHidden:NO];
    [self.activityView startAnimating];

    
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

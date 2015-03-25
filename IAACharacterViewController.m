//
//  IAACharacterViewController.m
//  StarWars
//
//  Created by Ivan on 24/03/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "IAACharacterViewController.h"



@interface IAACharacterViewController ()

@end

@implementation IAACharacterViewController

- (IBAction)playSound:(id)sender {
    //sacamos el sonido del modelo
    //lo reproducimos
    //CafPlayer *player =[CafPlayer cafPlayer];
    self.player = [CafPlayer cafPlayer];
    [self.player playSoundData:self.model.soundData];
    
}

-(id) initWithModel: ( IAAStarWarsCharacter*) model
{
    if (self=[super initWithNibName:nil bundle:nil])
    {
        _model=model;
        self.title = [model alias];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void) viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    //asegurarse que no se ocupa toda la pantalla cuando estas en un combinador
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    //sincronizar modelo y vista
    self.photoView.image=self.model.photo;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

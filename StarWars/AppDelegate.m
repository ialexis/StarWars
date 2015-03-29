//
//  AppDelegate.m
//  StarWars
//
//  Created by Ivan on 24/03/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "AppDelegate.h"
#import "IAAStarWarsCharacter.h"
#import "IAACharacterViewController.h"
#import "IAAWikiViewController.h"
#import "IAAStarWarsUniverse.h"
#import "IAAUniverseTableViewController.h"
#import "Settings.h"

@interface AppDelegate ()
 
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    //valor por defecto para ultimo personaje seleccionado
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    if (![def objectForKey:LAST_SELECTED_CHARACTER])
    {
        //Guardamos el valor por defecto
        [def setObject:@[@(IMPERIAL_SECTION),@0] forKey:LAST_SELECTED_CHARACTER] ;
        //por si acaso
        [def synchronize];
    }
    
    
    
    
    
    //Se crea una vista de tipo UIWindow
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    
    //creamos el modelo
    
    IAAStarWarsUniverse *universe = [IAAStarWarsUniverse new];
    
    
    //averiguamos el tipo de pantalla que tenemos
    if ([[UIDevice currentDevice] userInterfaceIdiom]==UIUserInterfaceIdiomPad)
    {
        //tipo tablet
        [self configureForPadWithModel:universe];
    }
    else
    {
        //tipo telefono
        [self configureForPhoneWithModel:universe];
    }
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - configure screen 
-(void) configureForPadWithModel: (IAAStarWarsUniverse *) universe
{
    //creamos los controladores
    
    IAAUniverseTableViewController *uVC=[[IAAUniverseTableViewController alloc]initWithModel:universe style:UITableViewStylePlain];
    IAACharacterViewController *charVC=[[IAACharacterViewController alloc] initWithModel:[self lastSelectedCharacterInModel: universe]];
    
    
    //creamos los Navigation Controllers
    
    UINavigationController *uNav = [UINavigationController new];
    [uNav pushViewController:uVC animated:NO];
    
    UINavigationController *cNav = [UINavigationController new];
    [cNav pushViewController:charVC animated:NO];
    
    
    //Creo el splitview controller
    
    UISplitViewController *spliVC = [[UISplitViewController alloc]init];
    spliVC.viewControllers = @[uNav, cNav];
    
    //asignamos delegados
    spliVC.delegate = charVC;
    uVC.delegate = charVC;

    
    
    // self.window.rootViewController=charVC;
    self.window.rootViewController=spliVC;

}

-(void) configureForPhoneWithModel: (IAAStarWarsUniverse *) universe
{
    //creamos el controlador
     IAAUniverseTableViewController *uVC=[[IAAUniverseTableViewController alloc]initWithModel:universe style:UITableViewStylePlain];
    
    //creamos el combinador
    UINavigationController *uNav = [UINavigationController new];
    [uNav pushViewController:uVC animated:NO];

    //Asignamos delegados
    uVC.delegate = uVC.self;
    
    //lo hacemos root
    self.window.rootViewController=uNav;

}


-(IAAStarWarsCharacter *)lastSelectedCharacterInModel: (IAAStarWarsUniverse *) u
{
    //obtengo el NSUserDefaults
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    
    //saco las coordenadas del ultimo personaje
    NSArray *coords = [def objectForKey:LAST_SELECTED_CHARACTER];
    NSUInteger section = [[coords objectAtIndex:0] integerValue];
    NSUInteger pos = [[coords objectAtIndex:1] integerValue];
    
    
    //obtengo el personaje
    IAAStarWarsCharacter *character;
    if (section == IMPERIAL_SECTION)
    {
        character = [u imperialAtIndex:pos];
        
    }
    else
    {
        character = [u rebelAtIndex:pos];
    }
    
    //lo devuelvo
    return character;
}
@end

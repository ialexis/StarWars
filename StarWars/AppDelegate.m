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

@interface AppDelegate ()
 
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    
    
    UITabBarController *tabVC=[[UITabBarController alloc]init];
    
    tabVC.viewControllers = [self arrayOfControllers];

    
   // self.window.rootViewController=charVC;
    self.window.rootViewController=tabVC;
    
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

#pragma mark - utils
-(NSArray *) arrayOfModels{
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

    return @[vader,chewie, c3po, r2d2, yoda];
    
}
-(NSArray *) arrayOfControllers
{
    NSArray *models = [self arrayOfModels];
    NSMutableArray *controllers = [NSMutableArray arrayWithCapacity:models.count];
    for (IAAStarWarsCharacter *each in models)
    {
        //Creo un controlador
        IAACharacterViewController *charVC = [[IAACharacterViewController alloc]initWithModel:each];
        //lo meto en un navigation
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:charVC];
        //lo añado al array de contraladores
        [controllers addObject:nav];
    }
    return controllers;
    
}
@end

//
//  IAAUniverseTableViewController.m
//  StarWars
//
//  Created by Ivan on 27/03/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "IAAUniverseTableViewController.h"
#import "IAACharacterViewController.h"

@interface IAAUniverseTableViewController ()

@end

@implementation IAAUniverseTableViewController

-(id) initWithModel: (IAAStarWarsUniverse *) model style:(UITableViewStyle)style
{
    if (self = [super initWithStyle:style])
    {
        _model=model;
        self.title=@"Star Wars Universe";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    if (section==IMPERIAL_SECTION)
    {
        return self.model.imperialsCount;
    }
    else
    {
        return self.model.rebelsCount;
    }
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    if (section==IMPERIAL_SECTION)
    {
        return @"Imperials";
    }
    else
    {
        return @"Rebelds";
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    //averiguar de que modelo (personaje) esta solicitando la celda
    IAAStarWarsCharacter *character = [self charactarAtIndexPath:indexPath];
    
    
    //Crear una celda
    static NSString * cellID=@"StarWarsCell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell==nil)
    {
        //la tenemos que crear nosotros desde cero
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                    reuseIdentifier:cellID];
    }
    
    //Configurar la celta
    //sincronizacmos modelo (personaje) con la vista (la celda)
    
    cell.imageView.image = character.photo;
    cell.textLabel.text=character.alias;
    cell.detailTextLabel.text=character.name;
    
    //Devolver la celda
    return cell;
}

#pragma mark - Delegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //averiguar de que modelo (personaje) me estan hablando
    
    
    IAAStarWarsCharacter *character = [self charactarAtIndexPath:indexPath];
    
   
    //crear el controlador de character
    
    IAACharacterViewController *charVC = [[IAACharacterViewController alloc]initWithModel:character];
    
    //hacemos un push
    [self.navigationController pushViewController:charVC animated:YES];
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Utils
- (IAAStarWarsCharacter *) charactarAtIndexPath: (NSIndexPath *) indexPath
{
    IAAStarWarsCharacter *character;
    if (indexPath.section==IMPERIAL_SECTION)
    {
        character = [self.model imperialAtIndex:indexPath.row];
    }
    else
    {
        character = [self.model rebelAtIndex:indexPath.row];
        
    }
    return character;
}

@end

//
//  EmpresaViewController.m
//  EESC-JR
//
//  Created by Pedro Góes on 09/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EmpresaViewController.h"
#import "GruposViewController.h"
#import "AreasAtuacaoViewController.h"
#import "WebViewController.h"

@interface EmpresaViewController ()

@end

@implementation EmpresaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib
    
    menuOptions = [[NSArray alloc] initWithObjects:@"História", @"Áreas de atuação", @"Propósito", @"Grupos", @"Conquistas Sociais", nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [menuOptions objectAtIndex:[indexPath row]];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

/*
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 [_objects removeObjectAtIndex:indexPath.row];
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        WebViewController *wvc = [[WebViewController alloc] initWithNibName:@"WebViewController_iPhone" bundle:nil];
        [wvc setScalesPageToFit:NO];
        [wvc setUrl:[[NSBundle mainBundle] URLForResource:@"historia" withExtension:@"html"]];
        [wvc setTitle:@"História"];
        
        [self.navigationController pushViewController:wvc animated:YES];
    } else if (indexPath.row == 1) {
        AreasAtuacaoViewController *aavc = [[AreasAtuacaoViewController alloc] initWithStyle:UITableViewStyleGrouped];
        
        [self.navigationController pushViewController:aavc animated:YES];
    } else if (indexPath.row == 2) {
        WebViewController *wvc = [[WebViewController alloc] initWithNibName:@"WebViewController_iPhone" bundle:nil];
        [wvc setScalesPageToFit:NO];
        [wvc setUrl:[[NSBundle mainBundle] URLForResource:@"proposito" withExtension:@"html"]];
        [wvc setTitle:@"Propósito"];
        
        [self.navigationController pushViewController:wvc animated:YES];
    } else if (indexPath.row == 3) {
        GruposViewController *gvc = [[GruposViewController alloc] initWithNibName:nil bundle:nil];
        [gvc setTitle:@"Galeria"];
        
        [self.navigationController pushViewController:gvc animated:YES];
    } else if (indexPath.row == 4) {
        WebViewController *wvc = [[WebViewController alloc] initWithNibName:@"WebViewController_iPhone" bundle:nil];
        [wvc setScalesPageToFit:NO];
        [wvc setUrl:[[NSBundle mainBundle] URLForResource:@"conquistas" withExtension:@"html"]];
        [wvc setTitle:@"Conquistas"];
        
        [self.navigationController pushViewController:wvc animated:YES];
    }

    [tableView deselectRowAtIndexPath:indexPath animated:YES];

   /* 
    if (!self.secondViewController) {
        self.secondViewController = [[SecondViewController alloc] initWithNibName:nil bundle:nil];
    }
    
    if ([indexPath row] == [_daysOfWeek count]-1) {
        self.secondViewController.lastDayOfTheWeek = YES;
    } else {
        self.secondViewController.lastDayOfTheWeek = NO;
    }
    
    self.secondViewController.title = [self.daysOfWeek objectAtIndex:[indexPath row]];
    self.secondViewController.infoMenu = [[self.menu objectForKey:@"restaurante"] objectForKey:[keysDaysOfWeek objectAtIndex:[indexPath row]]];
    
    // Since we're keeping a pointer to it, we need to force the (possible) update
    [self.secondViewController.tableView reloadData];
    
    [self.navigationController pushViewController:self.secondViewController animated:YES];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
     if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
     if (!self.detailViewController) {
     self.detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController_iPhone" bundle:nil];
     }
     self.detailViewController.detailItem = object;
     [self.navigationController pushViewController:self.detailViewController animated:YES];
     } else {
     self.detailViewController.detailItem = object;
     }
     */
}
@end

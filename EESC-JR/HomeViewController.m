//
//  HomeViewController.m
//  EESC-JR
//
//  Created by Pedro Góes on 09/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"
#import "AprovadosViewController.h"
#import "WebViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    homeOptions = [[NSArray alloc] initWithObjects:@"Aprovados na Dinâmica", @"Plano de Negócios", @"Feira de Carreiras", @"EESC Dia Feliz", nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:1.0 animations:^{
        [logoView setFrame:CGRectMake(0.0, 0.0, 83.0, 149.0)];
    } completion:^(BOOL fim) {
        
        [UIView animateWithDuration:1.0 animations:^{
            [logoTextoView setAlpha:1.0];
            [tabelaView setAlpha:1.0];
        } completion:^(BOOL fim) {
             //[web loadRequest:[NSURLRequest requestWithURL:[[NSBundle mainBundle] URLForResource:@"Wiki_Cidade_Dorme" withExtension:@"html"]]];
        }];
    }];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    /*
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        if (UIInterfaceOrientationIsLandscape(interfaceOrientation)) {
            return NO;
        }
    }
    
    return YES;
     */
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [homeOptions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [homeOptions objectAtIndex:indexPath.row];
    
    return cell;
}

/*
- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 66;
}


 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        AprovadosViewController *avc = [[AprovadosViewController alloc] initWithNibName:nil bundle:nil];
        [avc setTitle:@"Aprovados"];
        
        [self.navigationController pushViewController:avc animated:YES];
    } else if (indexPath.row == 1) {
        WebViewController *wvc = [[WebViewController alloc] initWithNibName:@"WebViewController_iPhone" bundle:nil];
        [wvc setScalesPageToFit:NO];
        [wvc setUrl:[[NSBundle mainBundle] URLForResource:@"plano" withExtension:@"html"]];
        [wvc setTitle:[homeOptions objectAtIndex:indexPath.row]];
        
        [self.navigationController pushViewController:wvc animated:YES];
    } else if (indexPath.row == 2) {
        WebViewController *wvc = [[WebViewController alloc] initWithNibName:@"WebViewController_iPhone" bundle:nil];
        [wvc setScalesPageToFit:NO];
        [wvc setUrl:[[NSBundle mainBundle] URLForResource:@"mercado" withExtension:@"html"]];
        [wvc setTitle:[homeOptions objectAtIndex:indexPath.row]];
        
        [self.navigationController pushViewController:wvc animated:YES];
    } else if (indexPath.row == 3) {
        WebViewController *wvc = [[WebViewController alloc] initWithNibName:@"WebViewController_iPhone" bundle:nil];
        [wvc setScalesPageToFit:NO];
        [wvc setUrl:[[NSBundle mainBundle] URLForResource:@"dia" withExtension:@"html"]];
        [wvc setTitle:[homeOptions objectAtIndex:indexPath.row]];
        
        [self.navigationController pushViewController:wvc animated:YES];
    }
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end

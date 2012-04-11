//
//  AprovadosViewController.m
//  EESC-JR
//
//  Created by Pedro Góes on 10/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AprovadosViewController.h"

@interface AprovadosViewController ()

@end

@implementation AprovadosViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    aprovados = [[NSArray alloc] initWithObjects:@"Adriana Bartsch Nagle", @"Amanda Costa Sperancin", @"Ana Carolina Deriggi", @"Ana Carolina Rafael Maia", @"Ana Laura Vendramel Joaquim", @"Ana Livia Barbosa Cintra", @"Ana Paula Lista", @"André Oliveira Da Paz", @"Anna Laura Pereira Rossi", @"Anoopa Muralikrishna", @"Aron De Campos Barros", @"Beatriz Ito Hoshino", @"Bruno Moser Nunes", @"Caio Zovaro Nascimento", @"Camila Pombeiro Sponchiado", @"Caroline Candido", @"Catarina Brunhara Batista", @"Diego Ferreira Adorno", @"Douglas Castanharo", @"Eduardo Simionato Braga", @"Fábio Augusto M. Cerqueira", @"Fabio Martino Zanini", @"Felipe Augusto Pereira", @"Felipe Magnus Carvalho Schmidt", @"Felipe Veríssimo Braido", @"Fernão Marcelo Monteiro", @"Ferrucio Polonio Junior", @"Francine Marvulle Tan", @"Gabriel Mota De Avila Ferreira", @"Giovana Dib Ishimura", @"Graciano Jorge Magno Gonçalves", @"Guilherme Antônio Faustini Ajeje", @"Guilherme Bortoletto Guimaraes", @"Guilherme Flandoli Romeiro", @"Guilherme Henrique Alves", @"Gustavo Mundim Caixeta", @"Gustavo Pontes De Oliveira Bertolini", @"Henrique Fernandes Marques", @"Hernani Castilho de Morais", @"Ivan Victor Mosca De Lima", @"Joao Paulo Guardabaxo Siqueira", @"João Victor Marmo", @"José Otávio Donadeli Tomé", @"Julia Milani Do Prado Rossi", @"Julia Landgraf Scatolin", @"Juliana Midori Hirono", @"Juliana Pigozzi", @"Juliana Ratto Gridi-Papp", @"Junio Irineu Moretti", @"Leonardo Korch Bezerra", @"Luana Souza", @"Lucas Leme", @"Lucas Oliveira Dos Santos Francato", @"Lucas Teslenco Mansano", @"Luiza Tavares Gamba", @"Maria Gabriela Nascimento", @"Mariana Kussaba", @"Maria Clara Montes", @"Marina Elias Brasileiro Do Carmo", @"Mateus Donizete Bernardo", @"Mateus Mota Morais", @"Mateus Silveira De Castro", @"Matheus Costa Carezia", @"Matheus Zagui Tonezer", @"Miguel Ribeiro Neto", @"Natalia Vobeto Pedra", @"Nayara Caroline Batista Resende", @"Pedro Góes", @"Pedro Mantegazza", @"Pedro Paulo Santos Vieira", @"Petry Carvalhal Melo", @"Rachel Bergantin", @"Rafael Alves Floquet", @"Rafael Gonçalves De Souza", @"Rafael Gustavo De Jesus Puppi", @"Rafael Lima", @"Rafael Silva Montes", @"Rafael Tavernaro Fraletti", @"Rafaela Manzini Zambonato", @"Renan Martins Carvalho", @"Roberta Evangelista Costa", @"Roberto Bissetti Vallim Lobo", @"Rodrigo Fernandes Lemos Bonin", @"Taís Zorzenon", @"Thaís Belato De Souza", @"Thais Croco Quinelato", @"Thales Lopes Correia Da Silva", @"Thiago Henrique Dos Santos", @"Thiago Marchini", @"Thiago Massaharu Shiguenaga", @"Thiago Silva De Benedito", @"Valmir Vieira Rocha Junior", @"Victor Zoratti Ferreira", @"Vinícius Carvalho Franco Barros", @"Vitor Costa Carvalho", @"Vitor Kiyoshi Endo Wesseling", @"Vitor Zanetti Bernardo", nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [aprovados count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = [aprovados objectAtIndex:[indexPath row]];
    
    return cell;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
}

/*
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end

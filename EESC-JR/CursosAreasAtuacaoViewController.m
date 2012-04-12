//
//  CursosAreasAtuacaoViewController.m
//  EESC-JR
//
//  Created by Pedro Góes on 09/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CursosAreasAtuacaoViewController.h"

@interface CursosAreasAtuacaoViewController ()

@end

@implementation CursosAreasAtuacaoViewController

@synthesize title, selectedCourse;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.tableView.separatorColor = [UIColor blackColor];
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
    
    areasOptions = [[NSArray alloc] initWithObjects:
                    [[NSArray alloc] initWithObjects: @"Inclusão para deficientes físicos", @"Desenho arquitetônico", @"Layout interno e externo de ambientes", @"Conforto de estruturas", @"Paisagismo", @"Comunicação visual", nil],
                    [[NSArray alloc] initWithObjects: @"Impacto e adequação ambiental de empresas", @"Recursos hídricos e energéticos", nil],
                    [[NSArray alloc] initWithObjects: @"Consultoria em construção civil", @"Seleção de materiais para construção", @"Planejamento e programação da construção", @"Orçamento da obra", @"Análise de sistemas de transportes", nil],
                    [[NSArray alloc] initWithObjects: @"Desenvolvimento de software", @"Optimização de sistemas", nil],
                    [[NSArray alloc] initWithObjects: @"Lógica digital", @"Instrumentação", @"Rendimento e qualidade de energia", @"Paisagismo", @"Sistemas elétricos", nil],
                    [[NSArray alloc] initWithObjects: @"Projetos e desenhos em CAD", @"Otimização de máquinas e equipamentos", @"Projetos de automação", @"Ensaios mecânicos", @"Tratamentos térmicos", nil],
                    [[NSArray alloc] initWithObjects: @"Sistemas de informações", @"Análise de viabilidade e plano de negócios", @"Análise de viabilidade e plano de negócios", @"Gestão de estoque, armazenagem e distribuição física", @"Organização e otimização de sistemas produtivos", nil],
                    nil];
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

- (void)setTitle:(NSString *)newTitle {
    self.navigationItem.title = newTitle;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[areasOptions objectAtIndex:selectedCourse] count];
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
    cell.textLabel.text = [[areasOptions objectAtIndex:selectedCourse] objectAtIndex:[indexPath row]];
    
    return cell;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 66;
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
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end

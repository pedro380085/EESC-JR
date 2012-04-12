//
//  ContatoViewController.m
//  EESC-JR
//
//  Created by Pedro Góes on 09/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ContatoViewController.h"

@interface ContatoViewController ()

@end

@implementation ContatoViewController

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
    
    shouldUpdate = NO;
    
    diretoresOptions = [[NSArray alloc] initWithObjects:@"Tamiris Benassi Mori", @"Fernanda Schwarzstein", @"Lucas Mazzotti Martini", @"Tiago Avelar Guimarães", @"Pedro Henrique Miranda", @"Marcelo Fonseca", @"Gabriela Perche", @"Heytor Pessoa", nil];
    
    emailOptions = [[NSArray alloc] initWithObjects:@"tamirismori@gmail.com", @"fer.schwarzstein@gmail.com", @"lufr14@gmail.com", @"tiago.avelar@gmail.com", @"pedro.henrique.s.miranda@gmail.com", @"marcelo.bussab@gmail.com", @"gabriela.perche@gmail.com", @"heytor.p@gmail.com", nil];
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

- (void)handleRadio:(QButtonElement *)button {
    
    QRadioElement *radio = (QRadioElement *) [self.root elementWithKey:@"radio"];
    QLabelElement *diretor = (QLabelElement *) [self.root elementWithKey:@"labelDiretor"];
    QLabelElement *email = (QLabelElement *) [self.root elementWithKey:@"labelEmail"];
    
    
    [diretor setValue:[diretoresOptions objectAtIndex:radio.selected]];
    [email setValue:[emailOptions objectAtIndex:radio.selected]];
    [self.quickDialogTableView reloadCellForElements:diretor, email, nil];
    
    shouldUpdate = YES;
}

- (void)sendMessage:(QButtonElement *)button {
    UIAlertView *alert = [[UIAlertView alloc] 
						  initWithTitle:@"Aviso" 
						  message: @"Mensagem enviada com sucesso!"
						  delegate:self 
						  cancelButtonTitle:@"Ok" 
						  otherButtonTitles:nil];
	[alert show];
}

     

@end

//
//  ContatoNavigationController.m
//  EESC-JR
//
//  Created by Pedro Góes on 11/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ContatoNavigationController.h"
#import "ContatoViewController.h"

@interface ContatoNavigationController ()

@end

@implementation ContatoNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Define all the properties of the viewController
    QRootElement *root = [[QRootElement alloc] init];
    root.title = @"Contato";
    root.grouped = YES;
    
    QSection *section = [[QSection alloc] initWithTitle:@"Escolha o departamento"];
    [root addSection:section];
    
    QRadioElement *radio = [[QRadioElement alloc] initWithItems:[NSArray arrayWithObjects:@"Presidente", @"Projetos", @"Jurídico", @"Marketing", @"RH", @"RSE",  @"Qualidade", @"Eventos", nil] selected:0];
    [radio setTitle:@"Departamento"];
    [radio setControllerAction:@"handleRadio:"];
    [radio setKey:@"radio"];
    [section addElement:radio];
    
    QLabelElement *labelDiretor = [[QLabelElement alloc] initWithTitle:@"Diretor" Value:@""];
    [labelDiretor setKey:@"labelDiretor"];
    [labelDiretor setControllerAction:@"handleRadio:"];
    [section addElement:labelDiretor];
    
    QLabelElement *labelEmail = [[QLabelElement alloc] initWithTitle:@"Email" Value:@""];
    [labelEmail setKey:@"labelEmail"];
    [labelEmail setControllerAction:@"handleRadio:"];
    [section addElement:labelEmail];
    
    QSection *section2 = [[QSection alloc] initWithTitle:@"Escreva a mensagem"];
    [root addSection:section2];
    
    QMultilineElement *message = [[QMultilineElement alloc] initWithTitle:@"Mensagem" Value:@"" Placeholder:@"Clique para digitar"];
    [message setKey:@"multiLineMessage"];
    [section2 addElement:message];
    
    QSection *section3 = [[QSection alloc] initWithTitle:@"E envie o email!"];
    [root addSection:section3];
    
    QButtonElement *button = [[QButtonElement alloc] initWithTitle:@"Enviar!"];
    [button setControllerAction:@"sendMessage:"];
    [section3 addElement:button];
     
     
    
    ContatoViewController *cvc = (ContatoViewController *) [[ContatoViewController alloc] initWithRoot:root];
    [self setViewControllers:[NSArray arrayWithObject:cvc]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

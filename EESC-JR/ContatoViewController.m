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
    
    self.navigationController.delegate = self;
    shouldUpdate = NO;
    
    diretoresOptions = [[NSArray alloc] initWithObjects:@"Tamiris Benassi Mori", @"Fernanda Schwarzstein", @"Lucas Mazzotti Martini", @"Tiago Avelar Guimarães", @"Pedro Henrique Miranda", @"Marcelo Fonseca", @"Gabriela Perche", @"Heytor Pessoa ", nil];
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
    shouldUpdate = YES;
}

#pragma mark - Navigation Controller Delegate

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (shouldUpdate) {
        QRadioElement *radio = (QRadioElement *) [self.root elementWithKey:@"radio"];
        QLabelElement *diretor = (QLabelElement *) [self.root elementWithKey:@"labelDiretor"];
        QLabelElement *email = (QLabelElement *) [self.root elementWithKey:@"labelEmail"];
        
        [diretor setValue:[diretoresOptions objectAtIndex:2]];
        [self.quickDialogTableView reloadCellForElements:diretor, nil];
        
        shouldUpdate = NO;
    }
}


     

@end

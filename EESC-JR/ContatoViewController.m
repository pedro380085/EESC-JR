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
    
    diretoresOptions = [[NSArray alloc] initWithObjects:@"Lucas Martini", @"Julia Salles", @"Jan Gamerschlag", @"Júlia Rossi", @"Beatriz Hoshino", @"Juliana Hirono", @"Helena Ogata", @"Rafael Souza", nil];
    
    emailOptions = [[NSArray alloc] initWithObjects:@"lufr14@gmail.com", @"julialxsalles@gmail.com", @"jan.gmr90@gmail.com", @"julia.mprossi@gmail.com", @"biahoshino@gmail.com", @"midori.hirono@gmail.com", @"helena.megale.ogata@gmail.com", @"rgsouza92@gmail.com", nil];
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


#pragma mark - Mail Methods

- (void)sendMessage:(QButtonElement *)button {
    
    if ([MFMailComposeViewController canSendMail]) {
        
        MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        
        QLabelElement *email = (QLabelElement *) [self.root elementWithKey:@"labelEmail"];
        QMultilineElement *message = (QMultilineElement *) [self.root elementWithKey:@"multiLineMessage"];
        
        [mailViewController setSubject:NSLocalizedString(@"Contato", @"Email Subject")];
        [mailViewController setToRecipients:@[email.value]];
        [mailViewController setMessageBody:message.textValue isHTML:NO];

        [self presentModalViewController:mailViewController animated:YES];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil) message:NSLocalizedString(@"Device can't send email", nil) delegate:nil cancelButtonTitle:nil otherButtonTitles: nil];
        [alertView show];
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
        [self dismissModalViewControllerAnimated:YES];
}

@end

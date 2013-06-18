//
//  ParceirosViewController.m
//  EESC-JR
//
//  Created by Pedro Góes on 09/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ParceirosViewController.h"

#define BUTTON_HEIGHT 48.0

@interface ParceirosViewController ()

@end

@implementation ParceirosViewController

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
    
    UIButton *documentButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [documentButton addTarget:self action:@selector(showDocument) forControlEvents:UIControlEventTouchDown];
    [documentButton setTitle:@"Apresentar documento de parceria" forState:UIControlStateNormal];
    documentButton.frame = CGRectMake(0.0, self.webview.frame.size.height - BUTTON_HEIGHT, self.webview.frame.size.width, BUTTON_HEIGHT);
    [self.view addSubview:documentButton];
    
    [self setScalesPageToFit:NO];
    [self setUrl:[[NSBundle mainBundle] URLForResource:@"parceria" withExtension:@"html"]];
    [self forceRequestLoad];
    
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

- (void)showDocument {
    WebViewController *wvc = [[WebViewController alloc] initWithNibName:@"WebViewController_iPhone" bundle:nil];
    [wvc setUrl:[[NSBundle mainBundle] URLForResource:@"Proposta_de_Parceria_2011" withExtension:@"pdf"]];
    [wvc setTitle:@"Documento"];
    
    [self.navigationController pushViewController:wvc animated:YES];
}

@end

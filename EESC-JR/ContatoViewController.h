//
//  ContatoViewController.h
//  EESC-JR
//
//  Created by Pedro Góes on 09/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ContatoViewController : QuickDialogController <MFMailComposeViewControllerDelegate> {
    NSArray *__strong diretoresOptions;
    NSArray *__strong emailOptions;
    
    BOOL shouldUpdate;
}

- (void)sendMessage:(QButtonElement *)button;

@end

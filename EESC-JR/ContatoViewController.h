//
//  ContatoViewController.h
//  EESC-JR
//
//  Created by Pedro Góes on 09/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContatoViewController : QuickDialogController <UINavigationControllerDelegate> {
    NSArray *__strong diretoresOptions;
    NSArray *__strong emailOptions;
    
    BOOL shouldUpdate;
}

@end

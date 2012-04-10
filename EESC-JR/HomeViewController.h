//
//  HomeViewController.h
//  EESC-JR
//
//  Created by Pedro Góes on 09/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    IBOutlet UIImageView *logoView;
    IBOutlet UIImageView *logoTextoView;
    IBOutlet UITableView *tabelaView;
    
    NSArray *__strong homeOptions;
}

@end

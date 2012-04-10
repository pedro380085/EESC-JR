//
//  WebViewController.h
//  EESC-JR
//
//  Created by Pedro Góes on 10/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController {
    IBOutlet UIWebView *webview;
}

@property (nonatomic, strong) UIWebView *webview;

@end

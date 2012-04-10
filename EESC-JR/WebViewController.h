//
//  WebViewController.h
//  EESC-JR
//
//  Created by Pedro Góes on 10/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController {
    IBOutlet UIWebView *__strong webview;
    NSURL *__strong url;
}

@property (nonatomic, strong) UIWebView *webview;
@property (nonatomic) NSURL *url;

@end

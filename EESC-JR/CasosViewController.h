//
//  CasosViewController.h
//  EESC-JR
//
//  Created by Pedro Góes on 09/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarouselViewController.h"

@interface CasosViewController : CarouselViewController <iCarouselDataSource, iCarouselDelegate, UIActionSheetDelegate> {
    NSMutableArray *__strong cases;
    NSMutableArray *__strong casesImages;
    NSMutableArray *__strong casesDescriptions;
    
    UIBarButtonItem *__strong barItem;
}

@end

//
//  GruposViewController.h
//  EESC-JR
//
//  Created by Pedro Góes on 10/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarouselViewController.h"

@interface GruposViewController : CarouselViewController <iCarouselDataSource, iCarouselDelegate> {
    NSMutableArray *__strong cases;
    NSMutableArray *__strong casesImages;
    NSMutableArray *__strong casesDescriptions;
}

@end

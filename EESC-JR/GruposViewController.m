//
//  GruposViewController.m
//  EESC-JR
//
//  Created by Pedro Góes on 10/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GruposViewController.h"
#import "WebViewController.h"

#define CONTENT_MARGIN 0.85

@interface GruposViewController ()

@end

@implementation GruposViewController

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
    
    carousel.decelerationRate = 0.9;
    carousel.type = iCarouselTypeCoverFlow2;
    
    cases = [NSMutableArray arrayWithObjects:@"rh", @"projetos", @"marketing", @"eventos", @"rse",  @"qualidade", @"juridico", nil];
    casesDescriptions = [NSMutableArray arrayWithObjects:@"Recursos Humanos", @"Projetos", @"Marketing", @"Eventos", @"RSE",  @"Qualidade", @"Jurídico", nil];
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


#pragma mark -
#pragma mark iCarousel methods

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return [cases count];
}

- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)carousel
{
    //limit the number of items views loaded concurrently (for performance reasons)
    //this also affects the appearance of circular-type carousels
    return 7;
}

- (UIView *)carousel:(iCarousel *)_carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
	UILabel *label = nil;
	UIImageView *image = nil;
    
	//create new view if no view is available for recycling
	if (view == nil) {
        //view = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, carousel.frame.size.width, carousel.frame.size.height)];
        view = [[UIView alloc] initWithFrame:CGRectZero];
        //view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
		image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[[cases objectAtIndex:index] stringByAppendingPathExtension:@"png"]]];
        [view addSubview:image];
        
        if (image.frame.size.width >= carousel.frame.size.width) {
            [image setFrame:CGRectMake(image.frame.origin.x, image.frame.origin.y, carousel.frame.size.width*CONTENT_MARGIN,
                                       (carousel.frame.size.width*CONTENT_MARGIN / image.frame.size.width) * image.frame.size.height)];
        }
        
        if (image.frame.size.height >= carousel.frame.size.height) {
            [image setFrame:CGRectMake(image.frame.origin.x, image.frame.origin.y, 
                                       (carousel.frame.size.height*CONTENT_MARGIN / image.frame.size.height) * image.frame.size.width, carousel.frame.size.height*CONTENT_MARGIN)];
        }
        
        [view setFrame:CGRectMake(0.0, 0.0, image.frame.size.width, image.frame.size.height + 45.0)];
        
		label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, image.frame.size.height, image.frame.size.width, 45.0)];
		label.backgroundColor = [UIColor clearColor];
		label.textAlignment = UITextAlignmentCenter;
        label.numberOfLines = 0;
		label.font = [label.font fontWithSize:16];
		[view addSubview:label];
	} else {
		label = [[view subviews] lastObject];
	}
	
    //set label
	label.text = [casesDescriptions objectAtIndex:index];
	
	return view;
}

/*
 - (NSUInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
 {
 //note: placeholder views are only displayed on some carousels if wrapping is disabled
 return INCLUDE_PLACEHOLDERS? 2: 0;
 }
 
 - (UIView *)carousel:(iCarousel *)carousel placeholderViewAtIndex:(NSUInteger)index reusingView:(UIView *)view
 {
 UILabel *label = nil;
 
 //create new view if no view is available for recycling
 if (view == nil)
 {
 view = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"page.png"]] autorelease];
 label = [[[UILabel alloc] initWithFrame:view.bounds] autorelease];
 label.backgroundColor = [UIColor clearColor];
 label.textAlignment = UITextAlignmentCenter;
 label.font = [label.font fontWithSize:50.0f];
 [view addSubview:label];
 }
 else
 {
 label = [[view subviews] lastObject];
 }
 
 //set label
 label.text = (index == 0)? @"[": @"]";
 
 return view;
 }
 */
- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    //usually this should be slightly wider than the item views
    return 200.0;
}

- (CGFloat)carousel:(iCarousel *)carousel itemAlphaForOffset:(CGFloat)offset
{
	//set opacity based on distance from camera
    return 1.0f - fminf(fmaxf(offset, 0.0f), 1.0f);
}

- (CATransform3D)carousel:(iCarousel *)_carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
{
    //implement 'flip3D' style carousel
    transform = CATransform3DRotate(transform, M_PI / 8.0f, 0.0f, 1.0f, 0.0f);
    return CATransform3DTranslate(transform, 0.0f, 0.0f, offset * carousel.itemWidth);
}

- (BOOL)carouselShouldWrap:(iCarousel *)carousel
{
    return NO;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    /*
    WebViewController *wvc = [[WebViewController alloc] initWithNibName:@"WebViewController_iPhone" bundle:nil];
    [wvc setUrl:[[NSBundle mainBundle] URLForResource:[cases objectAtIndex:index] withExtension:@"html"]];
    [wvc setTitle:[[cases objectAtIndex:index] capitalizedString]];
    
    [self.navigationController pushViewController:wvc animated:YES];
    
    */
}


@end

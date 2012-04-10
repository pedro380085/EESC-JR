//
//  CursosAreasAtuacaoViewController.h
//  EESC-JR
//
//  Created by Pedro Góes on 09/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CursosAreasAtuacaoViewController : UITableViewController {
    NSArray *__strong areasOptions;
    NSString *__strong title;
    NSInteger selectedCourse;
}

@property (nonatomic) NSString *title;
@property (nonatomic) NSInteger selectedCourse;

@end

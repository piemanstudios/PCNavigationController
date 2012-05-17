//
//  PCNavigationController.h
//  PCNavigationControllerTest
//
//  Created by Matthew Stephens on 22/11/2011.
//  Copyright (c) 2011 Pieman Studios Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCNavigationBar.h"
#import "PCNavigationControllerOverride.h"

@interface PCNavigationController : UIViewController <UINavigationControllerDelegate, PCNavigationBarDelegate> {
    
    PCNavigationControllerOverride *navigationController;
    PCNavigationBar *navigationBar;
}
@property (nonatomic,retain) UINavigationController *navigationController;
@property (nonatomic,retain) PCNavigationBar *navigationBar;

- (id)initWithRootViewController:(UIViewController *)root;


// Navigation Methods
-(void)setRootViewController:(UIViewController *)controller;
-(void)pushViewController:(UIViewController *)controller animated:(BOOL)animated;
-(void)popViewControllerAnimated:(BOOL)animated;
-(void)popToViewController:(UIViewController *)controller Animated:(BOOL)animated;

@end
